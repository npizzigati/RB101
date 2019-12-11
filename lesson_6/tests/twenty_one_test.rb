require 'minitest/autorun'
require_relative '../twenty_one.rb'

class DisplayCardsTest < Minitest::Test
  def test_deep_copy_card
    blank = [
      "┌─────────┐",
      "│         │",
      "│         │",
      "│         │",
      "│         │",
      "│         │",
      "│         │",
      "│         │",
      "└─────────┘"
    ]
    my_deep_copy = deep_copy_card_representation(blank)
    my_deep_copy = blank if !my_deep_copy
    my_deep_copy[1, 5] = 'X'

    refute_equal(blank, my_deep_copy)
  end

  def test_generate_ace_of_spades
    expected = [
      "┌─────────┐",
      "│A        │",
      "│♠        │",
      "│         │",
      "│    ♠    │",
      "│         │",
      "│        ♠│",
      "│        A│",
      "└─────────┘"
    ]
    actual = generate_card_representation('A', :spades)
    assert_equal(expected, actual)
  end

  def test_generate_jack_of_hearts
    expected = [
      "┌─────────┐",
      "│J        │",
      "│♥        │",
      "│         │",
      "│    ♥    │",
      "│         │",
      "│        ♥│",
      "│        J│",
      "└─────────┘"
    ]
    actual = generate_card_representation('J', :hearts)
    assert_equal(expected, actual)
  end

  def test_generate_card_back_representation
    expected = [
      "┌─────────┐",
      "│░░░░░░░░░│",
      "│░░░░░░░░░│",
      "│░░░░░░░░░│",
      "│░░░░░░░░░│",
      "│░░░░░░░░░│",
      "│░░░░░░░░░│",
      "│░░░░░░░░░│",
      "└─────────┘"
    ]
    actual = generate_card_back_representation
    assert_equal(expected, actual)
  end

  def test_generate_hand_representation
    hand = [['5', :spades], ['J', :hearts], ['Q', :hearts]]
    expected = [
      "┌─────────┐  ┌─────────┐  ┌─────────┐",
      "│5        │  │J        │  │Q        │",
      "│♠        │  │♥        │  │♥        │",
      "│         │  │         │  │         │",
      "│    ♠    │  │    ♥    │  │    ♥    │",
      "│         │  │         │  │         │",
      "│        ♠│  │        ♥│  │        ♥│",
      "│        5│  │        J│  │        Q│",
      "└─────────┘  └─────────┘  └─────────┘"
    ]
    actual = generate_hand_representation(hand)
    assert_equal(expected, actual)
  end

  def test_add_to_hand
    original_hand = [
      "┌─────────┐",
      "│░░░░░░░░░│",
      "│░░░░░░░░░│",
      "│░░░░░░░░░│",
      "│░░░░░░░░░│",
      "│░░░░░░░░░│",
      "│░░░░░░░░░│",
      "│░░░░░░░░░│",
      "└─────────┘"
    ]
    card = [
      "┌─────────┐",
      "│J        │",
      "│♥        │",
      "│         │",
      "│    ♥    │",
      "│         │",
      "│        ♥│",
      "│        J│",
      "└─────────┘"
    ]
    expected = [
      "┌─────────┐  ┌─────────┐",
      "│░░░░░░░░░│  │J        │",
      "│░░░░░░░░░│  │♥        │",
      "│░░░░░░░░░│  │         │",
      "│░░░░░░░░░│  │    ♥    │",
      "│░░░░░░░░░│  │         │",
      "│░░░░░░░░░│  │        ♥│",
      "│░░░░░░░░░│  │        J│",
      "└─────────┘  └─────────┘"
    ]

    actual = add_to_hand(original_hand, card)
    assert_equal(expected, actual)
  end

  def test_generate_initial_dealer_hand_representation
    expected = [
      "┌─────────┐  ┌─────────┐",
      "│░░░░░░░░░│  │K        │",
      "│░░░░░░░░░│  │♥        │",
      "│░░░░░░░░░│  │         │",
      "│░░░░░░░░░│  │    ♥    │",
      "│░░░░░░░░░│  │         │",
      "│░░░░░░░░░│  │        ♥│",
      "│░░░░░░░░░│  │        K│",
      "└─────────┘  └─────────┘"
    ]
    hand = [['4', :clubs], ['K', :hearts]]
    actual = generate_hand_representation(hand, first_card_visible: false)
    assert_equal(expected, actual)
  end

end

class DeckTest < Minitest::Test
  def test_initialized_deck_length
    deck = initialize_deck

    expected = 52
    actual = deck ? deck.length : nil
    assert_equal(expected, actual)
  end

  def test_initialized_deck_13_cards_are_spades
    deck = initialize_deck
    expected = 13
    actual = if deck
               deck.filter { |(_, suit)| suit == :spades }.count
             end
    assert_equal(expected, actual)
  end
end

class HandsTest < Minitest::Test
  def setup
    @deck = initialize_deck
  end

  def test_deal_initial_hand_each_player_has_two_cards
    player = []
    dealer = []
    deal_initial_hand(@deck, dealer, player)
    expected = [2, 2]
    actual = [player.length, dealer.length]
    assert_equal(expected, actual)
  end

  def test_participants_do_not_have_same_cards_after_dealing_first_hand
    player = []
    dealer = []
    deal_initial_hand(@deck, dealer, player)
    refute_equal(player, dealer)
  end

  def test_player_has_an_additional_card_after_hit
    player = [['A', :clubs], ['6', :hearts]]
    expected = 3
    player_after = hit(player, @deck)
    actual = player_after ? player_after.length : nil
    assert_equal(expected, actual)
  end

  def test_calculate_hand_total
    player = [['A', :clubs], ['6', :hearts],
              ['K', :spades], ['J', :clubs]]
    expected = 27
    actual = total(player)
    assert_equal(expected, actual)
  end

  def test_calculate_hand_total_2
    player = [['3', :clubs], ['A', :hearts],
              ['A', :spades], ['4', :clubs]]
    expected = 19
    actual = total(player)
    assert_equal(expected, actual)
  end

  def test_count_aces
    player = [['A', :clubs], ['6', :hearts],
              ['K', :spades], ['J', :clubs]]
    expected = 1
    actual = count_aces(player)
    assert_equal(expected, actual)
  end

  def test_busts? 
    player = [['A', :clubs], ['6', :hearts],
              ['K', :spades], ['J', :clubs]]
    expected = true
    actual = busts?(player)
    assert_equal(expected, actual)
  end

  def test_dealer_should_hit? 
    dealer = [['A', :clubs], ['3', :hearts], ['J', :clubs]]
    expected = true
    actual = dealer_should_hit?(dealer)
    assert_equal(expected, actual)
  end

  def test_prompt_hit
    $stdin.ungetc('h')
    assert_output(/hit/) { player_hit? }
  end

  def test_hit_if_user_presses_h_it_returns_true
    $stdin.ungetc('h')
    actual = player_hit?
    expected = true
    assert_equal(expected, actual)
  end

  def test_hit_if_user_presses_s_it_returns_false
    $stdin.ungetc('s')
    actual = player_hit?
    expected = false
    assert_equal(expected, actual)
  end
end

class PuttingItTogetherTest < Minitest::Test
  def test_input_returns_input
    $stdin.ungetc('c')
    expected = 'c'
    actual = input('This is a prompt.')
    assert_equal(expected, actual)
  end

  def test_input_shows_prompt
    $stdin.ungetc('c')
    expected = /This is a/
    assert_output(expected) { input('This is a prompt.') }
  end

  def test_show_instructions
    $stdin.ungetc('c')
    expected = /game of Twenty-One/
    assert_output(expected) { show_instructions }
  end

  def test_show_detailed_instructions
    $stdin.ungetc('c')
    expected = /Launch School/
    assert_output(expected) { show_detailed_instructions }
  end

  def test_display_initial_hands
    dealer = [['5', :clubs], ['A', :hearts]]
    player = [['3', :spades], ['K', :clubs]]
    expected = /░.*A.*3.*K/m
    assert_output(expected) do
      display_hands(results, dealer, player, :dealer_hide_first_card)
    end
  end

  def test_prompt_to_quit
    expected = /again/
    $stdin.ungetc('q')
    assert_output(expected) { quit? }
  end

  def test_y_returns_false_for_quit
    expected = false
    $stdin.ungetc('y')
    actual = quit?
    assert_equal(expected, actual)
  end

  def test_happy_path
    commands = %w(c s n)
    commands.each do |command|
      $stdin.ungetc(command)
    end

    assert_output(/Thanks/) { play_game }
  end
end
