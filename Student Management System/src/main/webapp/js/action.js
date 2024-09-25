 function semisterChange(){
            var semister=document.getElementById("semister").value;
            console.log(semister);

            if(semister =='First'){
                 var div1 = document.createElement("div");
                div1.innerHTML = `
                    <label for="sub1">Problem Solving and Programming using C :</label>
                    <input type="text" id="sub1" name="ssub1" required>  
                `;
                document.getElementById("s1").appendChild(div1);

                var div2 = document.createElement("div");
                div2.innerHTML = `
                     <label for= "sub1"> Computer Oraganization and Architecture :</label>
                     <input type="text" id="sub2" name="ssub2" required>
                    `;
                document.getElementById("s2").appendChild(div2);

                var div3 = document.createElement("div");
                div3.innerHTML = `
                     <label for="sub3">Discrete Mathematics :</label>
                     <input type="text" id="sub3" name="ssub3" required>
                    `;
                document.getElementById("s3").appendChild(div3);

                var div4 = document.createElement("div");
                div4.innerHTML = `
                      <label for="sub4">Communicative English :</label>
                     <input type="text" id="sub4" name="ssub4" required>
                    `;
                document.getElementById("s4").appendChild(div4);

                var div5 = document.createElement("div");
                div5.innerHTML = `
                    <label for="sub5">Engineering Economics & Accounting :</label>
                     <input type="text" id="sub5" name="ssub5" required>
                    `;
                document.getElementById("s5").appendChild(div5);

                var div6 = document.createElement("div");
                div6.innerHTML = `
                    <button type="submit"  class="btn" >Save</button>
                    `;
                document.getElementById("s6").appendChild(div6);
         
            }
            else if(semister == 'Second'){


                 var div1 = document.createElement("div");
                div1.innerHTML = `
                    <label for="sub1"> Oop's using C++:</label>
                    <input type="text" id="sub1" name="ssub1" required>  
                `;
                document.getElementById("s1").appendChild(div1);

                var div2 = document.createElement("div");
                div2.innerHTML = `
                     <label for= "sub1">Operating system :</label>
                     <input type="text" id="sub2" name="ssub2" required>
                    `;
                document.getElementById("s2").appendChild(div2);

                var div3 = document.createElement("div");
                div3.innerHTML = `
                     <label for="sub3"> Database Management System:</label>
                     <input type="text" id="sub3" name="ssub3" required>
                    `;
                document.getElementById("s3").appendChild(div3);

                var div4 = document.createElement("div");
                div4.innerHTML = `
                      <label for="sub4">Design of algorithem With Data Structure :</label>
                     <input type="text" id="sub4" name="ssub4" required>
                    `;
                document.getElementById("s4").appendChild(div4);

                var div5 = document.createElement("div");
                div5.innerHTML = `
                    <label for="sub5"> Formal Languages And Automata Theory:</label>
                     <input type="text" id="sub5" name="ssub5" required>
                    `;
                document.getElementById("s5").appendChild(div5);

                var div6 = document.createElement("div");
                div6.innerHTML = `
                    <button type="submit"  class="btn" >Save</button>
                    `;
                document.getElementById("s6").appendChild(div6);
                
            }
            else if (semister == 'Third'){
               
                var div1 = document.createElement("div");
                div1.innerHTML = `
                    <label for="sub1"> Programming With Java:</label>
                    <input type="text" id="sub1" name="ssub1" required>  
                `;
                document.getElementById("s1").appendChild(div1);

                var div2 = document.createElement("div");
                div2.innerHTML = `
                     <label for= "sub1">Data Communication and Computer Networks:</label>
                     <input type="text" id="sub2" name="ssub2" required>
                    `;
                document.getElementById("s2").appendChild(div2);

                var div3 = document.createElement("div");
                div3.innerHTML = `
                     <label for="sub3"> Compiler Design:</label>
                     <input type="text" id="sub3" name="ssub3" required>
                    `;
                document.getElementById("s3").appendChild(div3);

                var div4 = document.createElement("div");
                div4.innerHTML = `
                      <label for="sub4">Internet Of Things :</label>
                     <input type="text" id="sub4" name="ssub4" required>
                    `;
                document.getElementById("s4").appendChild(div4);

                var div5 = document.createElement("div");
                div5.innerHTML = `
                    <label for="sub5"> Data Warehousing And Data Mining:</label>
                     <input type="text" id="sub5" name="ssub5" required>
                    `;
                document.getElementById("s5").appendChild(div5);

                var div6 = document.createElement("div");
                div6.innerHTML = `
                    <button type="submit"  class="btn" >Save</button>
                    `;
                document.getElementById("s6").appendChild(div6);
            }
            else{
                var h1=document.createElement("h1");
                h1.innerHTML="Not Disclose yet ...";
                h1.style.color="White";
                h1.style.fontSize="24px";
                document.getElementById("s1").appendChild(h1);
            }
        }
        
        
        
        
        function resultSemisterChange(){

            var semister=document.getElementById("semister").value;
            console.log(semister);

             if(semister =='First'){

               document.getElementById("result1").style.display="";

             }
             else if(semister =='Second'){

              document.getElementById("result2").style.display="";

             }
             else if(semister =='Third'){

                document.getElementById("result3").style.display="";
 
             }
             else{

                var h1=document.createElement("h1");
                h1.innerHTML="Not Disclose yet ...";
                h1.style.color="White";
                h1.style.fontSize="24px";
                document.getElementById("result4").appendChild(h1);
                
            }


        }
        
        function showSemisterResult(){
			
			  var semister=document.getElementById("semister").value;
            console.log(semister);

             if(semister =='First'){

               document.getElementById("sem1").style.display="";

             }
             else if(semister =='Second'){

              document.getElementById("sem2").style.display="";

             }
             else if(semister =='Third'){

                document.getElementById("sem3").style.display="";
 
             }
             else{

                var h1=document.createElement("h1");
                h1.innerHTML="Not Disclose yet ...";
                h1.style.color="White";
                h1.style.fontSize="24px";
                var sem4=document.getElementById("sem4");
                sem4.style.textAlign="center";
                sem4.style.background = "rgba(42, 213, 42, 0.619)";
                sem4.stylepadding="12px";
                document.getElementById("sem4").appendChild(h1);
                
            }

		}
		
		function reloadPage(){
			
			location.reload();
			
		}
		
		
		function printResult(){
			
			const printbtn=document.getElementById("print");
			
			printbtn.addEventListener('click' ,function(){
				print();
			})
		}