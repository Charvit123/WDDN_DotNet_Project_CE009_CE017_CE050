<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Studentportal.Admin" %>

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
            width: 70%;
            max-height: 82%;
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
            opacity:0.9;
        }
        .Title{
            font-family: 'Courier New', monospace;
            font-size: 3rem;
            font-weight: 600;
            margin: 2rem 0;
            text-align: center;
        }
        .label{
            font-size: 2rem;
            font-weight: 600;
            color: white;
        }
        .inputgroup{
            display:flex;
        }
        .input{
            width: 100%;
            font-size: 2rem;
            line-height: 2rem;
            padding-left:10px;
            padding-bottom:3px;
            padding-top:3px;
            background: rgba(225,217,209,0.8);
            backdrop-filter: blur( 3px );
            border: 0;
            border-radius: 3px;
            outline: 0;
        }
        .filter{
            margin: 0 2rem;
        }
        .button{
            font-size: 2rem;
            margin: 2rem;
            padding: 0.6rem 1rem;
            border: 0;
            border-radius: 3px;
            background: rgba(204,153,102,0.9);
        }
        .button:hover{
            background: rgba(225,217,209,1);
        }
         .delet{
            text-decoration:none;
            color: blue;
        }
          .info{
            text-decoration:none;
            color: blue;
        }
        .edit{
            text-decoration:none;
            color: green;
        }
        .delete{
            text-decoration: none;
            color: red;
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
        .auto-style1 {
            left: -18px;
            top: 0px;
        }
        </style>
</head>
<body>
    <div class="container">
        <div class="nav">
            <ul class="nav-menu-inner">
                <li>
                    <a runat="server" class="an" href="AddStudent.aspx">Add Student</a>
                </li>
                <li>
                    <a runat="server" class="an" href="Courses.aspx">Manage Courses</a>                       
                </li>
                <li>
                    <a runat="server" class="an" href="Login.aspx">Logout</a>
                </li>
            </ul>
        </div>
        <img src="./Images/Login.jpg"/>
        <form id="form1" runat="server">
            <h2 class="Title">Admin</h2>
            <div class="inputgroup">
            <div class="filter">
            <p class="label">Sem:</p>
            <asp:DropDownList ID="DropDownList1" CssClass="input" runat="server">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
            </asp:DropDownList>
            </div>
            <div class="filter">
            <p class="label">Department:</p>
            <asp:DropDownList ID="DropDownList2" CssClass="input" runat="server">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>Computer</asp:ListItem>
                <asp:ListItem>Mechanical</asp:ListItem>
            </asp:DropDownList>
            </div>
            <asp:Button ID="Button1" CssClass="button" runat="server" OnClick="Button1_Click" Text="Filter" />
         </div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageButtonCount="4" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="False" DataKeyNames="Id" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="10" ForeColor="Black" GridLines="None">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns> 
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Fullname" HeaderText="Fullname" SortExpression="Fullname" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
                    <asp:BoundField DataField="Degree" HeaderText="Degree" SortExpression="Degree" />
                    <asp:BoundField DataField="Birthdate" HeaderText="Birthdate" SortExpression="Birthdate" />
                    <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                    <asp:BoundField DataField="Sem" HeaderText="Sem" SortExpression="Sem" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="info" CssClass="info" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="cinfo">info</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="edit" CssClass="edit" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="cedit">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="delete" CssClass="delete" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="cdelete" >Remove</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
     
                    </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerSettings FirstPageText="First" LastPageText="Last" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
    </form>
        </div>
</body>
</html>