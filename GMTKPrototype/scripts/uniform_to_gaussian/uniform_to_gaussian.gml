/// @desc Takes a number a within [0, 1), assumed to be uniform, and maps it to gassian
/// @param [0,1) Number to transform
// The isn't actually gaussian but it groups the items toward .5 nicely
// My google spreadsheet testing
// https://docs.google.com/spreadsheets/d/1AAcKRZfxB7aCkJEYYdGgdQosVtSxbDZKBii4We3MAyg/edit?usp=sharing

var n = argument0;

return .5 + sign(n - .5) * power(abs(n * .5), 1.5);