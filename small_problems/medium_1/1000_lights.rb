# 1000 Lights
# You have a bank of switches before you, numbered from 1 to n. Each switch is
# connected to exactly one light that is initially off. You walk down the row
# of switches and toggle every one of them. You go back to the beginning, and
# on this second pass, you toggle switches 2, 4, 6, and so on. On the third
# pass, you go back again to the beginning and toggle switches 3, 6, 9, and so
# on. You repeat this process and keep going until you have been through n
# repetitions.

# Write a method that takes one argument, the total number of switches, and
# returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is
# [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is
# [1, 4, 9].

=begin
input: integer n: total number of switches
output: array of which lights are on after n repetitions
rules:
explicit:
Each repetition is a pass through the lights, toggling each one from its
  current position to either on or off.
Toggle each light on the first pass. On the second pass, toggle multiples of
  two. On the third pass, toggle multiples of three. Etc.
implicit: na
algorithm:
create array with range of 0..n, pre-populating with all zeros. 0 index is
  just to keep the indices in line with their light number.
Loop n times using (1..n).each do (start at 1 because 0 idx is just a
  placeholder
  cnt = 0
  map array
    if cnt % outer loop == 0
    if num is divisble by idx + 1, toggle light by changed 1 to 0 or vice versa
use inject to determine indices of lights that are on:
use each_with_index with a counter to produce array of which lights are on
=end

def find_lights_on(num)
  lights = Array.new(num + 1) { |e| 0 }
  (1..num).each do |round|
    cnt = 0
    lights = lights.map do |light|
      if cnt == 0
        cnt = 1
        next
      end
      if cnt % round == 0
        light = (light == 1) ? 0 : 1
      end
      cnt += 1
      light
    end
  end
  cnt = 0
  lights_on = []
  lights.each_with_index do |light, idx|
    cnt += 1
    lights_on << idx if light == 1
  end
  lights_on
end
