import React from "react";

class Calculator extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            result: 0,
            num1: "",
            num2: ""
        }

        this.setNum1 = this.setNum1.bind(this);
        this.setNum2 = this.setNum2.bind(this);
        this.add = this.add.bind(this);
        this.subtract = this.subtract.bind(this);
        this.multiply = this.multiply.bind(this);
        this.divide = this.divide.bind(this);
        this.clear = this.clear.bind(this);
    }

    setNum1(e){
        this.setState({ num1: e.target.value});
    }

    setNum2(e){
        this.setState({ num2: e.target.value });
    }

    add(e){
        e.preventDefault();
        let calcNum1 = parseInt(this.state.num1);
        let calcNum2 = parseInt(this.state.num2);
        this.setState({ result: calcNum1 + calcNum2})
    }

    subtract(e) {
        e.preventDefault();
        let calcNum1 = parseInt(this.state.num1);
        let calcNum2 = parseInt(this.state.num2);
        this.setState({ result: calcNum1 - calcNum2 })
    }

    multiply(e) {
        e.preventDefault();
        let calcNum1 = parseInt(this.state.num1);
        let calcNum2 = parseInt(this.state.num2);
        this.setState({ result: calcNum1 * calcNum2 })
    }

    divide(e) {
        e.preventDefault();
        let calcNum1 = parseInt(this.state.num1);
        let calcNum2 = parseInt(this.state.num2);
        this.setState({ result: calcNum1 / calcNum2 })
    }

    clear(e){
        e.preventDefault();
        this.setState({ result: 0, num1: "", num2: ""});
    }

    render(){
        return(
            <div>
                <label htmlFor="num1">Num1</label>
                <input id="num1" type="text" onChange={this.setNum1} value ={this.state.num1}/>
                <label htmlFor="num2">Num2</label>
                <input id="num2" type="text" onChange={this.setNum2} value={this.state.num2} />
                <button onClick={this.add}>+</button>
                <button onClick={this.subtract}>-</button>
                <button onClick={this.multiply}>X</button>
                <button onClick={this.divide}>/</button>
                <button onClick = {this.clear}>Clear</button>
                <h1>{this.state.result}</h1>
            </div>
        );
    }
}

export default Calculator;