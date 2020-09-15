good = 0;
for z = 1:50

Num = 50;
hit = 0;

for k = 1:Num
  #ランダム生成
  S=zeros(8);
  ran = randperm(8);
  for i = 1:8
    S(ran(1,i), i) = 1;
  end
  
  S;
  
  #エネルギー関数
  E = queens_E_check(S);
  
  #正答個数の集計
  if (E == 0)
    hit ++;
  endif
end
#平均算出
ave = hit / Num * 100;

#fprintf('%d /%d\n',hit,Num);
#fprintf('%d percent \n',ave);

if (hit != 0)
    good ++;
    S
  endif

fprintf('%d /%d\n',good,z);
end
