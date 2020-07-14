clc;
clear all;
disp('Diffie Hellman Key Exchange Algorithm');
close all;

a1 = 2; 
b1 = 30;
p1 = primes(b1);
p1 = p1(p1 >= a1);
p_r_1 = p1(randperm(numel(p1),1));
fprintf('First random prime number generated is P: ');
disp(p_r_1)

a2 = 2; 
b2 = 20;
p2 = primes(b2);
p2 = p2(p2 >= a2);
p_r_2 = p2(randperm(numel(p2),1));
fprintf('Second random prime number generated is G: ');
disp(p_r_2)

%prompt = 'Please enter a primer number (P): ';
P = p_r_1;
A = isprime(P);
if A==1
    disp('P is a prime number');
else
    disp('P is not a prime number')
end

%prompt = 'Please enter a primer number (G): ';
%G = input(prompt)
G = p_r_2;
B = isprime(G)
if B==1
    disp('G is a prime number')
else
    disp('G is not a prime number')
end

%Alice selects a random secret integer a
%Bob selects a random secret integer b 
prompt = 'Alice, please enter your secret integer (a): ';
sec_a = input(prompt)
prompt = 'Bob, please enter your secret integer (b): ';
sec_b = input(prompt)

x1 = power(G, sec_a)
alice_pk = mod(x1, P)
disp(' Alice sends his public key to Bob : ');
disp(alice_pk)

y1 = power(G, sec_b)
bob_pk = mod(y1, P)
disp(' Bob sends his public key to Alice: ');
disp(bob_pk)

%Alice and Bob have just exchanged public keys
%Alice receives public key y2 = ?
%Bob receives public key x2 = ?
% Now Alice and Bob compute secret keys

%Alice secret key
alice_key = power(bob_pk, sec_a)
alice_sk = mod(alice_key , P)
disp(' Alice secret key is: ');
disp(alice_sk)

%Bob secret key
bob_key = power(alice_pk, sec_b)
bob_sk = mod(bob_key, P)
disp(' Bob secret key is: ');
disp(bob_sk)
if (alice_sk == bob_sk)
    disp(' Alice and Bob have same secret key')
else
    disp(' Keys do not match')
end
ssk = [' The shared secret key is: ',num2str(alice_sk),' & ', num2str(bob_sk)];
disp(ssk);
