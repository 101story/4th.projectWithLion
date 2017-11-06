# 1. into the folder
# 2. get file name 
# 3. rename "ruby1.txt"

Dir.chdir("src")
# newname = "ruby"
# Dir["*"].each do |old|
#     #puts old
#     File.rename(old, newname + old)
# end


# Dir.chdir("src")
# Dir.entries(Dir.pwd).reject do |fname|
## Dir.foreach(Dir.pwd) do |old|
#     File.rename(old, "ruby"+old)
# end
files = Dir.entries(Dir.pwd).reject { |fname| fname[0] == '.'}
files.each do |old|    
    File.rename(old, "ruby"+old)
end
