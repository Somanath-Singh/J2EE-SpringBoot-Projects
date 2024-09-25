<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@500&display=swap');
    </style>
</head>
<body>
    
    <!--     navbar -->
<%@include file="navbar.jsp" %>

   <section>
            <div class="container mt-5">
                <div class="row justify-content-left">
                    <div class="col-lg-8">
                        <h4 class="heading">Course Offered By CSEA Department</h4>

                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>SNo</th>
                                    <th>Code</th>
                                    <th>Course Name</th>
                                </tr>
                            </thead>
                            <tbody class="tbody">
                                <tr>
                                    <td>1</td>
                                    <td>20CAC101</td>
                                    <td><a class="Course" href="./courses/sub1.jsp">Problem Solving &
                                            Programming Using C</a></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>20CAC102</td>
                                    <td><a class="Course" href="#">Computer Organization
                                            and Architecture</a></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>20CAS102</td>
                                    <td><a class="Course" href="#">Discrete Mathematics</a></td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>20CAH101</td>
                                    <td><a class="Course" href="#">Communicative English</a></td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>20CAH102</td>
                                    <td><a class="Course" href="#">Engineering Economics &
                                            Accounting</a></td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>20CAL101</td>
                                    <td><a class="Course" href="#">Problem Solving using C
                                            Lab
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>20CAL102</td>
                                    <td><a class="Course" href="#">Communicative English
                                            Lab
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>20CAL103</td>
                                    <td><a class="Course" href="#">Computer Organization
                                            Lab
                                        </a></td>
                                </tr>

                                <!-- Paper-2 -->

                                <tr>
                                    <td>9</td>
                                    <td>20CAC203</td>
                                    <td><a class="Course" href="#">OOPs Using C++</a></td>
                                </tr>
                                <tr>
                                    <td>10</td>
                                    <td>20CAC204</td>
                                    <td><a class="Course" href="#">Operating System</a></td>
                                </tr>
                                <tr>
                                    <td>11</td>
                                    <td>20CAC205</td>
                                    <td><a class="Course" href="#">Database Management
                                            System</a></td>
                                </tr>
                                <tr>
                                    <td>12</td>
                                    <td>20CAC206</td>
                                    <td><a class="Course" href="#">Design of Algorithms
                                            with Data Structures</a></td>
                                </tr>
                                <tr>
                                    <td>13</td>
                                    <td>20CAC207</td>
                                    <td><a class="Course" href="#">Formal Languages and
                                            Automata Theory</a></td>
                                </tr>
                                <tr>
                                    <td>14</td>
                                    <td>20CAL204</td>
                                    <td><a class="Course" href="#">OOPs using C++ Lab
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>15</td>
                                    <td>20CAL205</td>
                                    <td><a class="Course" href="#">Database Management
                                            System Lab
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>16</td>
                                    <td>20CAL206</td>
                                    <td><a class="Course" href="#">Algorithms with Data
                                            Structures Lab
                                        </a></td>
                                </tr>

                                <!-- Paper-3 -->

                                <tr>
                                    <td>17</td>
                                    <td>20CAC308</td>
                                    <td><a class="Course" href="#">Programming with Java</a></td>
                                </tr>
                                <tr>
                                    <td>18</td>
                                    <td>20CAC309</td>
                                    <td><a class="Course" href="#">Data Communications and
                                            Computer Networks</a></td>
                                </tr>
                                <tr>
                                    <td>19</td>
                                    <td>20CAC310</td>
                                    <td><a class="Course" href="#">Compiler Design</a></td>
                                </tr>
                                <tr>
                                    <td>20</td>
                                    <td>20CAE301</td>
                                    <td><a class="Course" href="#">Wireless Ad Hoc &
                                            Sensor Networks</a></td>
                                </tr>
                                <tr>
                                    <td>21</td>
                                    <td>20CAE302</td>
                                    <td><a class="Course" href="#">Cloud Computing</a></td>
                                </tr>
                                <tr>
                                    <td>22</td>
                                    <td>20CAE303</td>
                                    <td><a class="Course" href="#">Internet of Things
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>23</td>
                                    <td>20CAE304</td>
                                    <td><a class="Course" href="#">Soft Computing
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>24</td>
                                    <td>20CAE305</td>
                                    <td><a class="Course" href="#">Mobile Computing
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>25</td>
                                    <td>20CAE306</td>
                                    <td><a class="Course" href="#">Simulation Modeling
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>26</td>
                                    <td>20CAE307</td>
                                    <td><a class="Course" href="#">Optimization Techniques
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>27</td>
                                    <td>20CAE308</td>
                                    <td><a class="Course" href="#">Data warehousing and
                                            Data Mining
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>28</td>
                                    <td>20CAE309</td>
                                    <td><a class="Course" href="#">Machine Learning
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>29</td>
                                    <td>20CAE310</td>
                                    <td><a class="Course" href="#">Big Data Analytics
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>30</td>
                                    <td>20CAE311</td>
                                    <td><a class="Course" href="#">Data Science with
                                            Applications
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>31</td>
                                    <td>20CAE312</td>
                                    <td><a class="Course" href="#">Natural Language
                                            Processing
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>32</td>
                                    <td>20CAE313</td>
                                    <td><a class="Course" href="#">Information Retrieval
                                            System
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>33</td>
                                    <td>20CAE314</td>
                                    <td><a class="Course" href="#">High Performance
                                            Computing
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>34</td>
                                    <td>20CAE315</td>
                                    <td><a class="Course" href="#">Cyber Security
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>35</td>
                                    <td>20CAL307</td>
                                    <td><a class="Course" href="#">Java Programming Lab
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>36</td>
                                    <td>20CAL308</td>
                                    <td><a class="Course" href="#">Computer Networks Lab
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>37</td>
                                    <td>20CAJ301
                                    </td>
                                    <td><a class="Course" href="#">Seminar & Technical
                                            Writing
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>38</td>
                                    <td>20CAJ302</td>
                                    <td><a class="Course" href="#">Summer Internship
                                            Evaluation
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>39</td>
                                    <td>20CAC411</td>
                                    <td><a class="Course" href="#">Artificial Intelligence
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>39</td>
                                    <td>20CAC412</td>
                                    <td><a class="Course" href="#">Object Oriented Software
                                            Engineering
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>40</td>
                                    <td>20CAC413</td>
                                    <td><a class="Course" href="#">Python Programming
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>41</td>
                                    <td>20CAJ403
                                    </td>
                                    <td><a class="Course" href="#">Project Work
                                        </a></td>
                                </tr>
                                <tr>
                                    <td>42</td>
                                    <td>20CAJ404</td>
                                    <td><a class="Course" href="#">Comprehensive Viva Voce
                                        </a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>



<!--     footer section -->
<%@include file="footer.jsp" %>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/5eb391e4c9.js" crossorigin="anonymous"></script>
</body>
</html>