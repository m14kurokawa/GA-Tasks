clearvars

generation = input('input of generation =');

Num = 50;
hit = 0;

for k = 1:Num #��ꐢ��̐���
  #�����_������
  S=zeros(8);
  ran = randperm(8);
  for i = 1:8
    S(ran(1,i), i) = 1;
  end
  
  #�G�l���M�[�֐�
  E = [k;queens_E_check(S)];
  
  #�������z��ւ̊i�[  
  Slist(:,:,k) = S; #�z��̃��X�g
  Elist(k,:) = E; #�G�l���M�[�֐��̃��X�g
  
  #�������̏W�v
  if (E(2,1) == 0)
    hit ++;
  endif
end

fprintf('First generation\n');
Elist

for o = 1:generation #�񐢑�ȍ~�̃��[�v
  #�z��̃\�[�g
  Elist = sortrows(Elist,2)
  fprintf('please wait...\n');
  fprintf('%dth generation\n',o);
  for k = 1:Num
    rank(:,:,k) = Slist(:,:,Elist(k,1));
  end
  Slist = rank;

  #��z�v���O����-----------------------------
    kohai = floor(rand() * 7 + 1); #��z�ʒu�P�`7�̃����_��

    for n = 21:1:35
    clear change;
      #���v�m�F 
      j=0;
      for k = kohai:8
        for l = kohai:8
          if (isequal(Slist(:, k, n),Slist(:, l, n+15)) == 1)
            j++;
            change(j,:) = [k l];
          endif
        end
      end
      
      #����
      if (j!=0)
        change = sort(change,'ascend');
        for m = 1:j
          S = Slist(:, change(m,1), n);
          Slist(:, change(m,1), n) = Slist(:, change(m,2), n+15);
          Slist(:, change(m,2), n+15) = S;
        end
        
      endif
    end
  #��z�v���O���������܂�-----------------------------

  hit = 0;
  #�G�l���M�[�֐�
  for k = 1:50
    E = [k queens_E_check(Slist(:, :, k))];
    
    #�������z��ւ̊i�[  
    Elist(k,:) = E;
    
    #�������̏W�v
    if (E(1,2) == 0)
      hit ++;
    endif
  end
end
Elist = sortrows(Elist,2)
fprintf('%dth generation\n',generation);
#���ώZ�o
ave = hit / Num * 100;

fprintf('%d /%d   %d percent \n',hit,Num,ave);

#���̕\��
if (Elist(1,2) == 0)
  Slist(:,:,1)
else
  fprintf('No solution found\n');
end