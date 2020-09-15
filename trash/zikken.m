#{
    for k = 41:50
      Slist(:,:,k) = zeros(8);
      ran = randperm(8);
      for i = 1:8
        Slist(ran(1,i),i,k)= 1;
      end
    end

 
#交配プログラム-----------------------------
  kohai = 4; #交配位置

  for n = 21:2:49
  clear change;
    #合致確認 
    j=0;
    for k = kohai:8
      for l = kohai:8
        if (isequal(Slist(:, k, n),Slist(:, l, n+1)) == 1)
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
        Slist(:, change(m,1), n) = Slist(:, change(m,2), n+1);
        Slist(:, change(m,2), n+1) = S;
      end
      
    endif
  end


clearvars

S=zeros(8);
  ran = randperm(8)
  for i = 1:8
    S(ran(1,i), i) = 1
  end


S1 = [1 0 0 0 0 0 0 0;
     0 0 0 0 1 0 0 0;
     0 0 0 0 0 0 0 1;
     0 0 0 0 0 1 0 0;
     0 0 1 0 0 0 0 0;
     0 0 0 0 0 0 1 0;
     0 1 0 0 0 0 0 0;
     0 0 0 1 0 0 0 0];
     
S2 = [1 0 0 0 0 0 0 0;
     0 0 0 0 1 0 0 0;
     0 0 0 0 0 0 0 1;
     0 0 0 0 0 1 0 0;
     0 0 1 0 0 0 0 0;
     0 0 0 0 0 0 1 0;
     0 1 0 0 0 0 0 0;
     0 1 0 1 0 0 0 0];
     


tf = isequal(S1(:, 2),S2(:, 2));
#Match = isequal(S(:, k),S(:, k));

randperm(8)

#}