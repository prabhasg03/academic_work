
@page
@model IndexModel
@{
ViewData["Title"]="Home Page"
}
<div class="text-center">
    <h1 class="display-4">Welcome</h1>
    <p>Learn about <a href="https://docs.microsoft.com/aspnet/core">Building Web apps with ASP.NET Core</a></p>
    <head><title>Table</title></head>
    <body>
        <table border="1" width="200" height="200">
            <caption>Invoice</caption>
            <tr>
                <th>S.NO</th>
                <th>Item</th>
                <th></th>
            </tr>
            <tr>
                <td>1</td>
                <td>Apple</td>
                <td>Rs.30/-</td>
            </tr>
            <tr>
                <td>2</td>
                <td>Mango</td>
                <td>Rs.15/-</td>
            </tr>
            <tr>
                <td>3</td>
                <td>Banana</td>
                <td>Rs.25/-</td>
            </tr>

        </table>
    </body>
</div>