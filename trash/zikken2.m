 
 
 
 kohai = 4; #交配位置

  for n = 21:1:35
  clear change;
    #合致確認 
    j=0;
    for k = kohai:8
      for l = kohai:8
        if (isequal(Slist(:, k, n),Slist(:, l, n+15)) == 1)
          n
          j++;
          change(j,:) = [k l]
        endif
      end
    end
    
    #交換
    if (j!=0)
      change = sort(change,'ascend');
      for m = 1:j
        S = Slist(:, change(m,1), n);
        Slist(:, change(m,1), n) = Slist(:, change(m,2), n+15);
        Slist(:, change(m,2), n+15) = S;
      end
      
    endif
  end
  
#{
      for n = 1:50
        if (isequal(Slist(:, :, n),Slist2(:, :, n)) == 1)
          n
        endif
      end


for i = 21:2:49
  i
endfor
#}