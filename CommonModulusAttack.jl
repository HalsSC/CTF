function CommonModulusAttack(e₁, c₁, e₂, c₂, N)
    d, u, v = gcdx(e₁, e₂)
    println("gcd(e₁,e₂):$d")

    e₁ = e₁ ÷ d
    e₂ = e₂ ÷ d
    d₀ = d
    d, u, v = gcdx(e₁, e₂)
    println("u:$u v:$v")
    println("e₁:$e₁*$d e₂:$e₂*$d")

    u < 0 && (c₁ = invmod(c₁, N))
    v < 0 && (c₂ = invmod(c₂, N))

    c₁ᵘ = powermod(c₁, abs(u), N)
    c₂ᵛ = powermod(c₂, abs(v), N)
    m = mod(c₁ᵘ * c₂ᵛ, N)

    m = trunc(BigInt, m ^ (1 / d₀))
    println("dec : " * string(m))
    println("hex : " * string(m, base=16))
    
    try
        flag = join(map(x -> Char(x), hex2bytes(string(m, base=16))))
        println("FLAG: $flag")
    catch
        println("FLAG: (m is not ascii)")
    end
end

function main()
    setprecision(2000);
    print("e₁:")
    e₁ = parse(BigInt, readline())
    print("c₁:")
    c₁ = parse(BigInt, readline())
    print("e₂:")
    e₂ = parse(BigInt, readline())
    print("c₂:")
    c₂ = parse(BigInt, readline())
    print("N:")
    N = parse(BigInt, readline())
    CommonModulusAttack(e₁, c₁, e₂, c₂, N)
end

main()