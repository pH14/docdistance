module DocumentDistance
  def self.create_vector(doc)
    wv = Hash.new(0)
    doc.scan(/((\w+'\w+)|[\w]+)/) do |w1, w2|
      if w1.nil?
        wv[w2.downcase] += 1
      elsif w2.nil?
        wv[w1.downcase] += 1
      else
        wv[w1.downcase] += 1
      end
    end
    
    wv
  end

  def self.cosine_similarity(vec1, vec2)
    mag_1 = vec1.values.map{|x| x**2}.inject(:+)
    mag_2 = vec2.values.map{|x| x**2}.inject(:+)
    sop = 0.0

    vec1.keys.uniq.each do |word|
      unless vec2[word].nil?
        sop += vec1[word] * vec2[word]
      end
    end

    denominator = Math.sqrt(mag_1 * mag_2)
    theta = Math.acos(sop / denominator)

    rescale = ((1 - (4*(theta / (2 * Math::PI)))) * 100).round(2)
  end

  def self.doc_distance(doc1, doc2)
    v1 = self.create_vector(doc1)
    v2 = self.create_vector(doc2)

    dd = self.cosine_similarity(self.create_vector(doc1),
                                self.create_vector(doc2))
    return dd, v1, v2
  end

end

if $0 == __FILE__
  doc1 = "A quick brown fox cats dogs dogs."
  doc2 = "Cookies"
  doc3 = "A quick bears black cats dogs dogs."
  puts DocumentDistance.doc_distance doc1, doc2
  puts DocumentDistance.doc_distance doc1, doc1
  puts DocumentDistance.doc_distance doc1, doc3
end
