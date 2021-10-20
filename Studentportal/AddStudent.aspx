<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="Studentportal.AddStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        *{
            font-family: monospace;
            margin: 0;
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
            width: 90%;
            max-height: 80%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
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
            font-size: 3rem;
            font-weight: 600;
            margin: 2rem 0;
            padding: 2rem 0;
            text-align: center;
        }
        .label{
            font-size: 2rem;
            font-weight: 600;
            padding: 1rem;
            margin: 2rem;
            color: white;
        }
        .input{
            width: 90%;
            font-size: 2rem;
            line-height: 2rem;
            padding-left:10px;
            padding-bottom:3px;
            padding-top:3px;
            margin: 0;
            background: rgba(225,217,209,0.8);
            backdrop-filter: blur( 3px );
            border: 0;
            border-radius: 3px;
            outline: 0;
            display: block;
            line-height: 5px;
        }
        .valid{
            color: yellow;
        }
        .ubtn{
            text-align: center;
        }
        .button{
            font-size: 2rem;
            margin-top: 1rem;
            padding: 1rem 2rem;
            border: 0;
            border-radius: 3px;
            background: rgba(225,217,209,0.8);
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
           height: 4rem;
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
    <script type="text/ecmascript">
        function validateDate(sender, args) {
            debugger;
            if (args.Value[2] != '/' && args.Value[5] != '/') {
                return args.IsValid = false;
            }
            else {
                return args.IsValid = true;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="nav">
            <ul class="nav-menu-inner">
                 <li>
                    <a runat="server" class="an" href="javascript: history.go(-1)">Go Back</a> 
                </li>
                <li>
                    <a runat="server" class="an" href="Login.aspx">Logout</a>
                </li>              
            </ul>
        </div>
        <img src="./Images/Login.jpg"/>
        <form id="form1" runat="server">
            <table>
                <tr>
                    <td >&nbsp;</td>
                    <td class="Title">Add Student</td>
                    <td>&nbsp;</td>
                </tr>
                <tr class="block">
                    <td class="label">Fullname:</td>
                    <td class="label">Email Address:</td>
                    <td class="label">Phone No.</td>
                </tr>
                <tr class="block">
                    <td>
                        <asp:TextBox ID="TextBox1" CssClass="input" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" CssClass="input" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" CssClass="input" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="valid" runat="server" ControlToValidate="TextBox1" ErrorMessage="Fullname is Required"></asp:RequiredFieldValidator>
                    </td>
                    <td >
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  CssClass="valid" runat="server" ControlToValidate="TextBox2" ErrorMessage="Email Address is Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  CssClass="valid" runat="server" ControlToValidate="TextBox2" ErrorMessage="You must enter Valid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  CssClass="valid" runat="server" ControlToValidate="TextBox3" ErrorMessage="Phone no is Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="valid" runat="server" ControlToValidate="TextBox3" ErrorMessage="You must enter Valid Phone no" ValidationExpression="^[6-9]\d{9}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label">Address:</td>
                    <td class="label">Gender:</td>
                    <td class="label">Course:</td>
                </tr>
                <tr>
                    <td >
                        <asp:TextBox ID="TextBox4" CssClass="input" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" CssClass="input" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" CssClass="input" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Computer</asp:ListItem>
                            <asp:ListItem>Chemical</asp:ListItem>
                            <asp:ListItem>Electrical</asp:ListItem>
                            <asp:ListItem>Mechanical</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="valid" runat="server" ControlToValidate="TextBox4" ErrorMessage="Address is Required"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="valid" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Gender is Required"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="valid" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Course is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label">Degree:</td>
                    <td class="label">BirthDate:</td>
                    <td class="label">Sem:</td>
                </tr>
                <tr>
                    <td >
                        <asp:DropDownList ID="DropDownList3" CssClass="input" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>B.Tech</asp:ListItem>
                            <asp:ListItem>M.Tech</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td >
                        <asp:TextBox ID="TextBox5" CssClass="input" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox6" CssClass="input" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="valid" runat="server" ControlToValidate="DropDownList3" ErrorMessage="Degree is Required"></asp:RequiredFieldValidator>
                    </td>
                    <td >
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" CssClass="valid" runat="server" ControlToValidate="TextBox5" ErrorMessage="BirthDate is Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CustomValidator ClientValidationFunction="validateDate" CssClass="valid" ID="CustomValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="You must enter valid BirthDate"></asp:CustomValidator>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" CssClass="valid" runat="server" ControlToValidate="TextBox6" ErrorMessage="Semester is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="ubtn">
                        <asp:Button ID="Button1" CssClass="button" runat="server" Text="Add Student" OnClick="Button1_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </form>
     </div>
</body>
</html>
