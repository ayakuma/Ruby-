loop do
  require "csv"

  puts "1(新規でメモを作成) 2(既存のメモ編集する) 3(メモを終了する)"
  memo_type = gets.to_i

  if memo_type == 1
    puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp

    puts "メモを入力"
    puts "入力後、Ctrl + D で保存"
    memo = STDIN.read

    CSV.open("#{file_name}.csv","w") do |csv|
      csv.puts ["#{memo}"]
    end
    
  elsif memo_type == 2
    puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp

    puts "追記したいメモを入力"
    puts "入力後、Ctrl + D で保存"
    memo = STDIN.read
    CSV.open("#{file_name}.csv","a") do |csv|
      csv << ["#{memo}"]
    end
    
  elsif memo_type == 3
    puts "メモ機能を終了します。"
    break

  else
    puts "1 or 2 or 3で入力してください。"
  end

end