module Levenshtein
  # Returns the Levenshtein distance as a number between 0.0 and 1.0.
  # It's basically the Levenshtein distance divided by the length of the longest string.

  def self.normalized_distance(s1, s2, threshold=nil)
    s1, s2 = s2, s1 if s1.mb_chars.length > s2.mb_chars.length # s1 is the short one; s2 is the long one.

    if s2.empty?
      0.0 # Since s1.mb_chars.length < s2.mb_chars.length, s1 must be empty as well.
    else
      if threshold
        if d = self.distance(s1, s2, (threshold*s2.mb_chars.length+1).to_i)
          d.to_f/s2.mb_chars.length
        else
          nil
        end
      else
        self.distance(s1, s2).to_f/s2.mb_chars.length
      end
    end
  end

  # Returns the Levenshtein distance between two byte strings.

  def self.distance(s1, s2, threshold=nil)
    s1, s2 = s2, s1 if s1.mb_chars.length > s2.mb_chars.length # s1 is the short one; s2 is the long one.

    # Handle some basic circumstances.

    return 0.0 if s1 == s2
    return s2.mb_chars.length if s1.empty?
    return nil if threshold and (s2.mb_chars.length-s1.mb_chars.length) >= threshold
    return nil if threshold and (s1.scan(/./) - s2.scan(/./)).length >= threshold
    return nil if threshold and (s2.scan(/./) - s1.scan(/./)).length >= threshold

    # Do the expensive calculation on a subset of the strings only, if possible.

    b = 0
    e1 = s1.mb_chars.length-1
    e2 = s2.mb_chars.length-1

    while s1.mb_chars[b, 1].to_s == s2.mb_chars[b, 1].to_s
      b += 1
    end

    while s1.mb_chars[e1, 1].to_s == s2.mb_chars[e2, 1].to_s and e1 > b and e2 > b
      e1 -= 1
      e2 -= 1
    end

    distance_part2_slow(s1[b..e1], s2[b..e2], threshold)
  end

  def self.distance_part2_slow(s1, s2, threshold)
    row = (0..s1.mb_chars.length).to_a

    1.upto(s2.mb_chars.length) do |y|
      prow = row
      row = [y]

      1.upto(s1.mb_chars.length) do |x|
        row[x] = [prow[x]+1, row[x-1]+1, prow[x-1]+(s1.mb_chars[x-1].to_s==s2.mb_chars[y-1].to_s ? 0 : 1)].min
      end

      # Stop analysing this string as soon as the best possible result for this string is bigger than the best result so far.
      # (The minimum value in the next row will be equal to or greater than the minimum value in this row.)

      return nil if threshold and row.min >= threshold
    end

    row[-1]
  end
end