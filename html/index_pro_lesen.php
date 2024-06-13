<!DOCTYPE html>
<html lang="de">
<link rel="stylesheet" type="text/css" href="projektwoche_style.css" />  
<form action="angest_2.php" method="post">
  <body>
  <h2> Suche nach Lehrern und ihren Projekte </h2>
  <input type="hidden" name="sent" value="1" />
  <table>
    <tr>
      <td> Lehrer Nachname: </td>
      <td> <input type="text" name="Nachname" size="25" /> </td>
    </tr>
    <tr>
      <td> Projekt: </td>
      <td> <input type="text" name="Projekt" size="25" /> </td>
    </tr>
    <tr>
      <td> </td>
      <td> <input type="submit" value="Absenden"> 
      </td>
    </tr>
  </table>
     <tfoot>
            <tr>
                <td colspan="2">
                    <input type="button" value="Zurück" onclick="history.back()">
                </td>
            </tr>
        </tfoot>
  </body>
</html>
