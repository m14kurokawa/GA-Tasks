good = 0;
Num = 0;

while true
  Num ++;
  #�����_������
  S=zeros(8);
  do
      ran = floor(rand(1, 2) * 8 + 1);
      S(ran(1,1), ran(1,2)) = 1;
  until (sum(sum(S)) >= 10)
  S;
  
  #�G�l���M�[�֐�
  E = queens_E_check(S);
  
  #�������̏W�v
  if (E == 0)
    S
    good ++;
    fprintf('%d /%d\n',good,Num);
    break
  elseif (rem(Num,500) == 0)
    fprintf('%d /%d\n',good,Num);
  endif
end
