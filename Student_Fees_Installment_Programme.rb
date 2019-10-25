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
monthlyInst=0
while i < instStructure.size 
    loop do
        puts "\nEnter the amount to be paid for Installment #{i+1}"
        monthlyInst = gets.to_i
        sum = 0
        for k in i...instStructure.size do
            sum += instStructure[k]
        end
        if  sum >= monthlyInst
            break
        end
        puts "\n Please enter the valid amount, less than or equal to remaining amount."
    end
    
    if monthlyInst > instStructure[i]
        
        if ((monthlyInst-instStructure[i]) >= instStructure[i+1])
            j=i
            mntinst=monthlyInst
            while ((j < instStructure.size-1) && ((monthlyInst-instStructure[j]) >= instStructure[j+1]))
                monthlyInst = monthlyInst-(instStructure[j]+instStructure[j+1])
                instStructure[j+1] = 0
                j=j+1
            end
            if (j<instStructure.size-1)
                instStructure[j+1] = instStructure[j+1]-monthlyInst
            end
            instStructure[i] = mntinst
        else
            instStructure[i+1] = instStructure[i+1]-(monthlyInst-instStructure[i])
            instStructure[i] = monthlyInst
        end
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
    if (j==instStructure.size-1)
        break
    end
end
puts "\nThank you, all Installments are paid now."
