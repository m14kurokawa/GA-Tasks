good = 0;
for z = 1:50
  
Num = 50;
hit = 0;

for k = 1:Num
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
    hit ++;
  endif
end
#���ώZ�o
ave = hit / Num * 100;

#fprintf('%d /%d\n',hit,Num);
#fprintf('%d percent \n',ave);

if (hit != 0)
    good ++;
    S
  endif
fprintf('%d /%d\n',good,z);
end
