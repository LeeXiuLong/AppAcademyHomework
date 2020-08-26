function madLib(verb, adj, noun) {

    console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`);
}

function isSubstring(searchString, subString){
    console.log(searchString.includes(subString));
}

function fizzBuzz(array){
    let newArray = []
    for(i = 0; i < array.length; i++){
        if (array[i] % 5 === 0 || array[i] % 3 === 0 || array[i] % 15 === 0){
            newArray.push(array[i]);
        }
    }
    console.log(newArray);
}

function isPrime(number){
    let final;
    for(i = 2; i < number; i++){
        if(number % i === 0){
            final = false;
            // console.log(final);
            return false;
        }
    }
    final = true;
    // console.log(final);
    return true;
}

function sumOfNPrimes(n){
    let i = 0;
    let counter = 0;
    let currentNum = 2;
    while(counter < n){
        if(isPrime(currentNum)){
            i += currentNum
            counter += 1
        }
        currentNum += 1
    }
    console.log(i);
}

madLib('make', 'best', 'guac');
isSubstring("time to program", "time");
isSubstring("Jump for joy", "joys");
fizzBuzz([1,2,3,4,5,6,7,8,9,10,15,20,25,27,33,30]);
isPrime(2);
isPrime(10);
isPrime(15485863);
isPrime(3548563);
sumOfNPrimes(0);
sumOfNPrimes(1);
sumOfNPrimes(4);