<!DOCTYPE html>
<html lang="de">
<link rel="stylesheet" type="text/css" href="projektwoche_style.css" />  	
<form action="eingabe_projekt.php" method="post">
  <body>
  <h2> Trage ein neues Projekt ein  </h2>
  <input type="hidden" name="sent" value="1" />
  <table>
    <tr>
      <td> Projektname: </td>
      <td> <input type="text" name="Projektname" size="25" /> </td>
    </tr>
    <tr>
      <td> Max Teilnehmer: </td>
      <td> <input type="text" name="MaxTeilnehmer" size="25" /> </td>
    </tr>
    <tr>
		   <td> Leitung: </td>
      <td> <input type="text" name="Leitung" size="25" /> </td>
    </tr>
    <tr>

      <td> </td>
      <td> <input type="submit" value="Absenden" /> </td>
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
