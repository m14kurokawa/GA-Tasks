Num = input('Number of trials =')
hit = 0;

for k = 1:Num
  fprintf('--------------------------------------\n');
  #ランダム生成
  S=zeros(8);
  do
      ran = floor(rand(1, 2) * 8 + 1);
      S(ran(1,1), ran(1,2)) = 1;
  until (sum(sum(S)) >= 10)
  S
  
  #エネルギー関数
  E = queens_E_check(S)
  
  #正答個数の集計
  if (E == 0)
    hit ++;
  endif
end
#平均算出
ave = hit / Num * 100;

fprintf('%d /%d\n',hit,Num);
fprintf('%d percent \n',ave);
