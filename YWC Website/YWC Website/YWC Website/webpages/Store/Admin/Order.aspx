<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="webpages_Store_Admin_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">

        <asp:Panel ID="pnlOrders" runat="server">
            <br />
    </asp:Panel>

            <table>
            <tr>
                <td>
                    <b>Total: </b>
                </td>
                <td>
                    <asp:Literal ID="litTotal" runat="server" Text=""></asp:Literal>
                </td>
            </tr>

            <tr>
                <td>
                    <b>Tax: </b>
                </td>
                <td>
                    <asp:Literal ID="litVat" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Shipping: </b>
                </td>
                <td>
                    $ 15
                </td>
            </tr>

            <tr>
                <td>
                    <b>Total Amount: </b>
                </td>
                <td>
                    <asp:Literal ID="litTotalAmount" runat="server" Text="" />
                </td>
            </tr>



        </table>

    <p>

    </p>

                <table>
            <tr>
                <td>
                    <b>Client Name : </b>
                </td>
                <td>
                    <asp:Literal ID="litClientName" runat="server" Text=""></asp:Literal>
                </td>
            </tr>

            <tr>
                <td>
                    <b>Client Email: </b>
                </td>
                <td>
                    <asp:Literal ID="litClientEmail" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Shipping Address: </b>
                </td>
                <td>
                   <asp:Literal ID="litClientAddress" runat="server" Text="" />
                </td>
            </tr>

            <tr>
                <td>
                    <b>Date Purchased: </b>
                </td>
                <td>
                    <asp:Literal ID="litPurchaseDate" runat="server" Text="" />
                </td>
            </tr>



        </table>

    <div style="text-align:center">

        <p>
            ____________________________________________________________________________________________________________________________________</p>
        <p>
            &nbsp;</p>
        <p>

            <asp:Label ID="lblOrderStatus" runat="server" Text="Order Not Confirmed" Font-Bold="True" Font-Size="Large"></asp:Label>

    </p>
        <p>

            <asp:Label ID="lblOrderStatusDesc" runat="server" Text="Order confirmation not yet confirmerd. Please enter the tracking ID number provided by the post office to send delivery confirmation to client."></asp:Label>

    </p>
        <p>

            <asp:TextBox ID="textBoxTracking" runat="server" BorderWidth="3px" Font-Bold="False" Font-Size="Small" Height="18px" Width="344px" style="text-align:center"></asp:TextBox>

    </p>
        <p>

            <asp:Button ID="buttonSend" runat="server" Font-Bold="True" Font-Size="Small" Height="36px" Text="Send Confirmation" Width="216px" OnClick="buttonSend_Click" />

    </p>

            <p>
                <asp:LinkButton ID="lnkDeleteOrder" runat="server" OnClick="lnkDeleteOrder_Click">Delete Order</asp:LinkButton>
            </p>

    </div>


    </asp:Content>

