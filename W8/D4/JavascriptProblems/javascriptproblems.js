function titleize(array, callback){
    titleizedNames = array.map(function(el){
        return "Mx. " + el + " Jingleheimer Schmidt"
    })
    titleizedNames.forEach(function(el){
        return callback(el);
    })
}

function Elephant(name, height, tricks){
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}

Elephant.prototype.trumpet = function(){
    return `${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`
}

Elephant.prototype.grow = function(){
    this.height += 12;
}

Elephant.prototype.addTrick = function(trick){
    this.tricks.push(trick);
}

Elephant.prototype.play = function(){
    let currentTrick = this.tricks[Math.floor(Math.random()*this.tricks.length)]
    return `${this.name} is ${currentTrick}`
}


Elephant.paradeHelper = function(elephant) {
    console.log(`${elephant.name} is trotting by!`);
}

function printCallback(el){
    console.log(el);
}

function dinerBreakfast(){
    order = ["cheesy scrambled eggs"]
    return function(el){
        order.push(el);
        returnString = "I'd like " + order[0];
        newOrders = order.slice(1, order.length)
        newOrders.forEach(function(el){
            returnString += " and " + el
        })
        returnString += " please."
        console.log(returnString);
    }
}
names = ["Mary", "Brian", "Leo"];

titleize(names, printCallback);

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

herd.forEach(Elephant.paradeHelper);

let bfastOrder = dinerBreakfast();

bfastOrder("chocolate chip pancakes");

bfastOrder("grits");