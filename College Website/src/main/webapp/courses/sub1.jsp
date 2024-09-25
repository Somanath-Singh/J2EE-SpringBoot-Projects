<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/style.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@500&display=swap')
	;
</style>
</head>
<body>

	<!--     navbar -->
	<%@include file="./navbar.jsp"%>

	<section>
		<div class="container mt-5">
			<div class="row justify-content-center">

				<div class="col-lg-10 pt-2">

					<h3 class="heading pb-4 underline-heading">Problem Solving & Programming Using C</h3>

					<h5 class="course-heading">Course Objectives:</h5>

					<p>The course is designed to provide knowledge of C language
						and programming concepts. Students will be able to develop logics
						which will help them to create programs, applications in C. Also
						by learning the basic programming constructs they can easily
						switch over to any other language in future.</p>

					<h6 class="course-heading">Module I</h6>
					<p>Problem-Solving Through Computers: Problem Solving
						Strategies, Flow Charts, Algorithms, and Pseudo Codes, Structured
						Programming Approach, Compiling, Linking and Executing, Syntax and
						Semantic errors. C Programming Basics: Character Set, Key Words,
						Identifiers, Data Types, Variables and Constants, Operators and
						Expressions, Type Conversions. Control Structures: Branching - If,
						Nested if-else and Switch, Looping - While, Do-While and For,
						Unconditional Jumps - Continue, Break and GOTO.Arrays and Strings:
						Concept of Arrays, One Dimensional and Multidimensional Arrays,
						Applications of Arrays, Concept of Strings, String Handling
						Functions, Array of Strings.</p>


					<h6 class="course-heading">Module II</h6>
					<p>Pointers: Pointer Variable and its Importance,
						Dereferencing, Pointer Arithmetic and Scale Factor, Pointers and
						Arrays, Pointer and Strings, Array of Pointers, Pointers to
						Pointers. Functions: Designing Structured Programs, User Defined
						and Standard Functions, Formal and Actual Arguments, Function
						Prototype, Parameter Passing, Functions Returning Multiple Values,
						Functions Returning Pointers, Pointers to Functions, Nesting of
						Functions, Recursion, Passing Arrays to Functions. Scope and
						Extent: Scope Rules, Storage Classes - Auto, Extern, Register and
						Static.</p>

					<h6 class="course-heading">Module III</h6>
					<p>Structures, Unions and Enumerations: Declaration and
						Initialization of Structures, Structure as Function Parameters,
						Structure Pointers, Unions, Enumerations. Dynamic Memory
						Management: Concepts and Implementations. Advance
						Structures:Sparse Matrixes, Self-Referential Structures, Linked
						Lists - Single Linked Lists, Double Linked Lists, Circular Linked
						Lists.</p>


					<h6 class="course-heading">Module IV</h6>
					<p>Input and Output Models: Console I/O Concepts and
						Operations, File I/O Concepts, Defining a File, Opening and
						Closing a File, I/O Operations in Files, Random Access to Files,
						Error Handling. Command Line Arguments: What is Command Line and
						Why Command Line, Implementations, Use of Environment Vector.
						Pre-Processing: Dealing with Important Pre-Processor Directives.
						Graphics Programming: Drawing Different Shapes, Using Colours,
						Pens and Brushes, Displaying Bitmaps, Animations.</p>


					<h6 class="course-heading">Course Outcomes:</h6>
					<p>Learning Outcomes: Upon completion of this course, students
						will acquire knowledge about: Able to implement the algorithms and
						draw flowcharts for solving Mathematical and Engineering problems.
						Demonstrate an understanding of computer programming language
						concepts. To be able to develop C programs</p>
						
						<br>
					<h6 class="course-heading">Text Books:</h6>

					<ol>
						<li>Herbert Schildt, "C The Complete Reference", McGraw-Hill
							Publication</li>
						<li>Byron Gottfried, "Schaum's Outline of Programming with
							C", McGraw-Hill.</li>
					</ol>
					
					<br>
					<h6 class="course-heading">Reference Books:</h6>
					<ol>
						<li>. Pradip Dey, Manas Ghosh, Programming in C, Second
							Edition, Oxford University Press, 2011 .</li>
						<li>Brian W. Kernighan, Dennis Ritchie, The C Programming
							Language (2nd Edition), 1988, Prentice Hall.</li>
						<li>E. Balagurusamy, Programming in ANSI C, 4th edition,
							2007, McGraw-Hill Publication, New Delhi. (Module 1: Chapters
							1-4, Module 2: Chapters 5-8, Module 3: Chapters 9, 11, Module 4:
							Chapters 10, 12-14).</li>
						<li>Yashavant P. Kanetkar. Let Us C, BPB Publications,
							2011.</li>
						<li>K.R. Venugopal, S.R. Prasad, Mastering C, McGraw-Hill
							Education India</li>
						<li>Online Link (Mooc): <a
							href="https://nptel.ac.in/courses/106/104/106104128/" target="_blank">https://nptel.ac.in/courses/106/104/106104128/</a></li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<!--     footer section -->
	<%@include file="./footer.jsp"%>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/5eb391e4c9.js"
		crossorigin="anonymous"></script>
</body>
</html>