function E = queens_E_check(S)

  #E1
  C1 = 1;
  E1 = 0;
  for i = 1:1:8
    for j = 1:1:8
      E1 += (S(i, j)*(1-S(i, j)));
    endfor
  endfor
  E1 = C1/2*E1;


  #E2
  C2 = 1;
  E2 = 0;
  for i = 1:1:8
    E2in = 0;
    for j = 1:1:8
      E2in += S(i, j);
    endfor
    E2 += (E2in - 1).^2;
  endfor
  E2 = C2/2*E2;


  #E3
  C3 = 1;
  E3 = 0;
  for j = 1:1:8
    E3in = 0;
    for i = 1:1:8
      E3in += S(i, j);
    endfor
    E3 += (E3in - 1).^2;
  endfor
  E3 = C3/2*E3;


  #E4,E5
  C4 = 1;
  E4 = 0;
  C5 = 1;
  E5 = 0;
  for n = 2:16 #16は行列の数マス×２ 課題の番号を入力（1~3）
    for i = 1:n-1
      j = n - i;
      if(i <= 8 && j <= 8)
        for I = i+1:n-1
          J = n - I;      
          if(I <= 8 && J <= 8)
            E4 += (S(i, j) * S(I, J));
            E5 += (S(abs(9-i), j) * S(abs(9-I), J));
          endif
        endfor
      endif
    endfor
  endfor
  E4 = C4/2*E4;
  E5 = C5/2*E5;

  #E
  E = E1 + E2 + E3 + E4 + E5;

end
