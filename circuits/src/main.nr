fn main(x: Field, A: pub Field, B: pub Field, C: pub Field, D: pub Field) {
    // Prove knowledge of x such that A*x*x + B*x + C = D
    let lhs = A * x * x + B * x + C;
    assert(lhs == D);
}

#[test]
fn test_valid_solution() {
    // Example: A = 3, B = 4, C = 5, x = 2
    // 3*2*2 + 4*2 + 5 = 12 + 8 + 5 = 25
    let x = 2;
    let A = 3;
    let B = 4;
    let C = 5;
    let D = 25;
    main(x, A, B, C, D);
}

#[test(should_fail)]
fn test_invalid_solution_wrong_x() {
    // Using the same A, B, C, D but x is wrong
    let x = 3; // should be 2
    let A = 3;
    let B = 4;
    let C = 5;
    let D = 25;
    main(x, A, B, C, D);
}

#[test(should_fail)]
fn test_invalid_equation_parameters() {
    // Wrong coefficients that don't satisfy the equation for x=2
    let x = 2;
    let A = 3;
    let B = 4;
    let C = 10; // wrong C
    let D = 25;
    main(x, A, B, C, D);
}
