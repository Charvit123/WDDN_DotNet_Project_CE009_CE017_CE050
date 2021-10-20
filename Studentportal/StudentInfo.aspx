<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentInfo.aspx.cs" Inherits="Studentportal.StudentInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        *{
            font-family: monospace;
            margin: 0;
            font-size: 1.3rem;
        }
        #form1{
            position:absolute;
            background: rgba( 1, 1, 1, 0.37 );
            backdrop-filter: blur( 10px );
            box-shadow: 0 8px 32px 0 rgba( 2, 2, 2, 0.37 );
            border-radius: 10px;
            border: 1px solid rgba( 2, 2, 2, 0.1 );
            top: 50%;
            left: 50%;
            transform:translate(-50%, -50%);
            z-index:2;           
            width: 40%;
            max-height: 80%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 1.5rem;
        }
        img{
            display: block;
            max-width: 100%;
            width: 100%;
            height: 100vh;
            object-fit: cover;
            z-index: 1;
            position: relative;
        }
        .Title{
            font-family: 'Courier New', monospace;
            font-size: 1.5rem;
            font-weight: 600;
            margin: 2rem 0;
            text-align: center;
        }
        .label{
            font-size: 2rem;
            font-weight: 600;
            padding: 1rem;
            margin: 2rem;
            color: white;
        }
        .nav{
            position: fixed;
            z-index: 10;
        }
        ul{
           list-style: none;
           display: inline-flex;
           justify-content: flex-end;
           align-items: center;
           padding:0 1rem;
           font-size: 2rem;
           background: rgba( 1, 1, 1, 0.7 );
           backdrop-filter: blur( 10px );
           box-shadow: 0 8px 32px 0 rgba( 2, 2, 2, 0.37 );
           border: 1px solid rgba( 2, 2, 2, 0.1 );
           width: 98.5vw;
           height: 3rem;
        }
        li{
            margin: 0 2rem;
        }
        .an{
            color: white;
            text-decoration: none;
            padding: 0.8rem 0.1rem;
        }
        .an:hover{
            background: white;
            color: black;
        }
    </style>
    <title></title>
    </head>
<body>
    <div class="container">
        <div class="nav">
            <ul class="nav-menu-inner">
                <li>
                    <a id="LinkButton2" runat="server" class="an" href="AddResult.aspx" visible="false">Add Result</a>
                </li>
                <li>
                    <a runat="server" class="an" href="MyCourses.aspx">Courses</a>
                </li>
                <li>
                    <a runat="server" class="an" href="ShowResult.aspx">Show Result</a>
                </li>
                <li>
                    <a runat="server" class="an" href="Login.aspx">Logout</a>
                </li>
            </ul>
        </div>
    <img src="./Images/Login.jpg"/>
    <form id="form1" runat="server">   
        <h2 class="Title">Student Information</h2>
        <table>  
            <tr>  
                <td align="center">  
                    <asp:PlaceHolder ID="DBDataPlaceHolder" runat="server"></asp:PlaceHolder>  
                </td>  
            </tr>  
        </table>  
    </form>
        </div>
</body>
</html>
