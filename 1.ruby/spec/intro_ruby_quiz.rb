
# arr에 있는 모든 요소를 더하세요.
def sum arr
    arr.sum
    #arr.inject(0){|sum,x| sum+x}
end

# arr에 있는 최대값 2개를 더하세요.
def max_2_sum arr
    #(arr.sort.last(2)).inject(:+)? (arr.sort.last(2)).inject(:+) : 0 
    arr.max(2).inject(0){|sum, i| sum+i}
end

# 두개의 값으로 n 이 될수 있나?
def sum_to_n? arr, n
    arr.combination(2).any? {|c1, c2| c1+c2==n}
end

# Part 2

# "hello 이름"을 출력하는 코드를 쓰세요.
def hello(name)
    "Hello, #{name}"
end

# 자음으로 시작하는지 판별하는 코드를 쓰세요.
def starts_with_consonant? s
    /^[^aeiou\W]/i.match(s)? true : false
    #!%w(a e i o u).include? s.downcase[0] unless s.empty? or /^\W/.match(s)
end


