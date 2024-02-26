function [m]=decrypt(c,n,e)
%DECRYPT Function to decrypt a message c given the public key (n,e).
    [n,d]=keydecrypt(n,e);
    m=1;
    for i=1:d
        m=mod(m*c,n);
end