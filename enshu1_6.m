clearvars

Num = 50
hit = 0;

for k = 1:Num
  fprintf('--------------------------------------\n');
  #ランダム生成
  S=zeros(8);
  ran = randperm(8);
  for i = 1:8
    S(ran(1,i), i) = 1;
  end
  
  S;
  
  #エネルギー関数
  E = [k;queens_E_check(S)];
  
  #多次元配列への格納  
  Slist(:,:,k) = S;
  Elist(k,:) = E;
  
  #正答個数の集計
  if (E == 0)
    hit ++;
  endif
end
#平均算出
ave = hit / Num * 100;

fprintf('%d /%d\n',hit,Num);
fprintf('%d percent \n',ave);

#配列のソート
Elist = sortrows(Elist,2)
for k = 1:Num
  rank(:,:,k) = Slist(:,:,Elist(k,1));
end

