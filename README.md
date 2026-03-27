# ds

fun main() {
    // Dados da conta
    val numeroConta: String = "CC-2024-001"
    val agencia: String = "0042"
    var saldo: Double = 1500.0
    var titular: String? = "Alice"

    // Exibe cabeçalho
    val nomeExibido = titular?.uppercase() ?: "Cliente não identificado"
    println("Conta   : $numeroConta | Agência: $agencia")
    println("Titular : $nomeExibido")
    println("■".repeat(40))

    // Transações
    fun processarTransacao(valor: Double, tipo: String, taxa: Double = 0.0): Double {
        val valorLiquido = valor - (valor * taxa / 100)
        return when (tipo) {
            "deposito"      -> saldo + valorLiquido
            "saque"         -> saldo - valorLiquido
            "transferencia" -> saldo - valorLiquido
            else            -> saldo
        }
    }

    saldo = processarTransacao(valor = 500.0, tipo = "deposito")
    println("Depósito : R$ 500,00 → Saldo: R$ ${"%.2f".format(saldo)}")

    saldo = processarTransacao(valor = 200.0, tipo = "saque", taxa = 2.5)
    println("Saque    : R$ 200,00 → Saldo: R$ ${"%.2f".format(saldo)} (taxa 2,5%)")
    println("■".repeat(40))

    // Regras de negócio
    fun aplicarRegra(s: Double, regra: (Double) -> Double): Double = regra(s)

    val saldoComImposto = aplicarRegra(saldo) { s -> s - (s * 0.15) }
    val saldoComBonus   = aplicarRegra(saldo) { s -> s + (s * 0.05) }

    println("Com imposto: R$ ${"%.2f".format(saldoComImposto)}")
    println("Com bônus  : R$ ${"%.2f".format(saldoComBonus)}")
}
```

**Saída:**
```
Conta   : CC-2024-001 | Agência: 0042
Titular : ALICE
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
Depósito : R$ 500,00 → Saldo: R$ 2000,00
Saque    : R$ 200,00 → Saldo: R$ 1805,00 (taxa 2,5%)
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
Com imposto: R$ 1534,25
Com bônus  : R$ 1895,25