// Secret command for finding anything in a Mac from the terminal here is the command:

// find ~ -name the_name_of_file -print



// # By Sam the Great from forums
// # That freaking superhero has been frequenting Udacity
// # as his favorite boss battle fight stage. The 'Udacity'
// # banner keeps breaking, and money is being wasted on
// # repairs. This time, we need you to proceduralize the
// # fixing process by building a machine to automatically
// # search through debris and return the 'Udacity' banner
// # to the company, and be able to similarly fix other goods.

// # Write a Python procedure fix_machine to take 2 string inputs
// # and returns the 2nd input string as the output if all of its
// # characters can be found in the 1st input string and "Give me
// # something that's not useless next time." if it's impossible.

// # NOTE: # If you are experiencing difficulties taking
//         # this problem seriously, please refer back to
//         # "Superhero flyby", the prequel, in Problem Set 11.

// # TOOLS: # if statement
//          # while loop
//          # string operations
//          # Unit 1 Basics

// # BONUS: # 
// # 5***** #  If you've graduated from CS101,
// #  Gold  #  try solving this in one line.
// # Stars! #

function fix_machine(big_string, little_string){

	return matcher( big_string, little_string )
}

function splitter(little_string){
	var an_array = little_string.split("");
	return an_array;
} 

function matcher(big_string,little_string){
	var some_array = [];
	some_array = splitter(little_string)
	var counter1 = 0;
	var the_letter = "a";
	var the_number = 0;
	while (counter1 < little_string.length){
		the_letter = some_array[counter1];
		the_number = big_string.indexOf(the_letter);
		if (the_number === -1 ){
			return "Give me something that's not useless next time.";
		}
		counter1 ++;
	}
		return big_string;

}

// some_array(counter1)

// ### TEST CASES ###
// print "Test case 1: ", fix_machine('UdaciousUdacitee', 'Udacity') == "Give me something that's not useless next time."
// print "Test case 2: ", fix_machine('buy me dat Unicorn', 'Udacity') == 'Udacity'
// print "Test case 3: ", fix_machine('AEIOU and sometimes y... c', 'Udacity') == 'Udacity'
// print "Test case 4: ", fix_machine('wsx0-=mttrhix', 't-shirt') == 't-shirt'

console.log(fix_machine('wsx0-=mttrhix','t-shirt'));
