# 1. into special folder (src)
# 2. create file
# 3. write something

Dir.chdir("src")
puts Dir.pwd

# 30 개의 파일 만들기 1.txt ~ 30.txt 
# 내용 "1번째 내용"

for i in (1..30) do
#30.times do |i|
    #File.new(i.to_s+".txt", "w")
    File.open(i.to_s+".txt", "w") do |f|
        f.write(i.to_s+"번째 내용")
    end
end

count = 1
newname = "car"
Dir["/path/to/folder/*"].each do |old|
  File.rename(old, newname + count.to_s)
  count += 1
end

