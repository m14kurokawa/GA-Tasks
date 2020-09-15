good = 0;
seikai= zeros(50, 1)
for z = 1:50

clearvars -except good z seikai

generation = 50;

Num = 50;
hit = 0;

for k = 1:Num #第一世代の生成
  #ランダム生成
  S=zeros(8);
  ran = randperm(8);
  for i = 1:8
    S(ran(1,i), i) = 1;
  end
  
  #エネルギー関数
  E = [k;queens_E_check(S)];
  
  #多次元配列への格納  
  Slist(:,:,k) = S; #配列のリスト
  Elist(k,:) = E; #エネルギー関数のリスト
  
  #正答個数の集計
  if (E(2,1) == 0)
    hit ++;
  endif
end

#fprintf('First generation\n');
#Elist

for o = 1:generation #二世代以降のループ
  #配列のソート
  Elist = sortrows(Elist,2);
  #fprintf('please wait...\n');
  #fprintf('%dth generation\n',o);
  for k = 1:Num
    rank(:,:,k) = Slist(:,:,Elist(k,1));
  end
  Slist = rank;

  #交配プログラム-----------------------------
    kohai = floor(rand() * 7 + 1); #交配位置１〜7のランダム

    for n = 21:2:49
    clear change;
      #合致確認 
      j=0;
      for k = kohai:8
        for l = kohai:8
          if (isequal(Slist(:, k, n),Slist(:, l, n+1)) == 1)
            j++;
            change(j,:) = [k l];
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
  #交配プログラムここまで-----------------------------
  
  #5世代に一度突然変異プログラム----------------------
  if (rem(o,5) == 0)
    for k = 41:50
      Slist(:,:,k) = zeros(8);
      ran = randperm(8);
      for i = 1:8
        Slist(ran(1,i),i,k)= 1;
      end
    end
  endif
  #5世代に一度突然変異プログラムここまで-----------------

  hit = 0;
  #エネルギー関数
  for k = 1:50
    E = [k queens_E_check(Slist(:, :, k))];
    
    #多次元配列への格納  
    Elist(k,:) = E;
    
    #正答個数の集計
    if (E(1,2) == 0)
      hit ++;
    endif
  end
  if (Elist(1,2) == 0)
    seikai(o, 1)++;
  endif
end

Elist = sortrows(Elist,2);
#fprintf('%dth generation\n',generation);

#平均算出
ave = hit / Num * 100;


#解の表示
if (Elist(1,2) == 0)
  Slist(:,:,1)
else
  #fprintf('No solution found\n');
end

if (Elist(1,2) == 0)
    good ++;
  endif
fprintf('%d /%d\n',good,z);
seikai
end
good
