# Student Fees Installment Programme

puts "Enter Fees Amount"
amount = gets.to_i
puts "\nEnter Number of Installment";
instNumber = gets.to_i
instAmount = amount/instNumber
instStructure = Array.new(instNumber, instAmount)
puts "\nInstallment Structure: #{instStructure}"
structureSize = instStructure.size 
i=0
while i < instStructure.size 
    puts "\nEnter the amount to be paid for Installment #{i+1}"
    monthlyInst = gets.to_i
    if monthlyInst > instStructure[i]
        instStructure[i+1] = instStructure[i+1]-(monthlyInst-instStructure[i])
        instStructure[i] = monthlyInst
    elsif monthlyInst < instStructure[i]
        if i==instStructure.size-1
            choice=2
        else
            puts "\nIf you want add remaining amount in next installment then enter 1 or enter 2 to create new installment."
            choice = gets.to_i
        end
        if choice==1
            instStructure[i+1] = instStructure[i+1]+(instStructure[i]-monthlyInst)
            instStructure[i] = monthlyInst
        elsif choice==2
            instStructure << instStructure[i]-monthlyInst.to_i
            instStructure[i] = monthlyInst
        end
    end 
    puts "\nInstallment Structure: #{instStructure}"
    i=i+1
end
if i==instStructure.size
    puts "\nThank you, all Installments are paid now."
end