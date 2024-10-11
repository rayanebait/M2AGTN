def f(x,n):
    return (x**2+1)%n

def pollard_rho(n):
    x_k=1
    x_2k=1

    x_k=f(x_k,n)
    x_2k=f(f(x_2k,n),n)
    while gcd(x_k-x_2k, n)==1:
        x_k=f(x_k,n)
        x_2k=f(f(x_2k,n),n)
    return gcd(x_k-x_2k, n)


p=ZZ.random_element(10**10, 10**15).next_prime()
q=ZZ.random_element(2**128, 2**256).next_prime()

n=p*q
print("Facteurs avec sage :", factor(n))
print("Facteurs avec pollard : ", pollard_rho(n))
