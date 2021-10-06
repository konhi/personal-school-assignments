// ---- Zmienne i operatory w JavaScript ----

// -- Sposoby deklarowania zmiennych i stałych w JS --
var x // Deklarowanie zmiennej...
var x = 'Hello world! 👋' // i przypisywanie jej początkowej wartości!

// ⌛ Po wprowadzeniu ES6 używa się jednak:
let x
const x

// ✅ let może zmieniać swój typ! 

let x = 2
console.log(x) // 2

x = 'Jan Kowalski'
console.log(x) // Jan Kowalski

// ❌ Natomiast const nie...
const y = 2

// ❌ Uncaught TypeError: invalid assignment to const 'y'
y = 'Adam Nowak'

// -- Przykłady operatorów --

x = 5 // (przypisywanie do liczby) 5
x = pobierzDane() // (przypisywanie do wyniku funkcji)

'Hello' + 'World' // (dodawanie tekstu) Hello World

5 + 5 // (dodawanie liczb) 10
5 - 5 // (odejmowanie) 0
5 * 5 // (mnożenie) 25
5 / 5 // (dzielenie) 0
7 % 5 // (modulo) 2

// -- Typy Danych --

true // Prawda
false // Fałsz
null // Brak wartości
undefined // Niezdefiniowany typ
42 // Number, typ numeryczny
2n ** 53n // BigInt, typ numeryczny
'Hello World!' // String, typ tekstowy

{
    symbol: 'Hello World!' // Obiekt
    symbol2: 'dhjkfgdgmdgd,'
    symbol3: 42
}

// 🔼 Obiekt. Pierwsza wartość to Symbol, druga może być dowolnego typu.

// Możemy przypisać obiekt do zmiennej...
const pracownik = {
    imie: 'Adam',
    nazwisko: 'Nowak',
    wynagrodzenie: 3000
}

// a następnie odnieśc się do klucza w danym obiekcie!

pracownik['imie'] // Adam
pracownik.nazwisko // Nowak