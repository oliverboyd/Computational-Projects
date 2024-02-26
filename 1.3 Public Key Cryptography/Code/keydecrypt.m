function [n,d]=keydecrypt(n,e)
%KEYDECRYPT Function to compute the private decryption key (n,d) from a
%given public encryption key (n,e).
    f=factorise(n);
    p=f(1);
    q=f(2);
    phi=(p-1)*(q-1);
    d=cong(e,1,phi);
end