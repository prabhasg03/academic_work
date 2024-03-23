<?xml version="1.0" encoding="UTF-8"?>
<html xsl:version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <body style="font-family: Times New Roman; font-size: 10pt; background-color: lightblue">
        <br/>
        <br/>
        <br/>
        <center>
            <caption>LIBRARY</caption>
            <div style="color: red">
                <caption>BOOKS</caption>
            </div>
            <br/>
            <br/>
            <table style="background-color: pink" cellspacing="10" cellpadding="10" border="1">
                <tr style="background-color: lightgrey">
                    <th>TITLE</th>
                    <th>AUTHOR</th>
                    <th>ISBN-NO</th>
                    <th>PUBLISHER</th>
                    <th>EDITION</th>
                    <th>PRICE</th>
                </tr>
                <xsl:for-each select="lib/book">
                    <tr>
                        <td style="background-color: lightyellow; text-transform: uppercase">
                            <xsl:value-of select="title"/>
                        </td>
                        <td style="background-color: lightgreen; font-weight: bold; text-transform: uppercase">
                            <xsl:value-of select="author"/>
                        </td>
                        <td style="background-color: lightyellow">
                            <xsl:value-of select="isbn-no"/>
                        </td>
                        <td style="background-color: lightyellow; text-transform: uppercase">
                            <xsl:value-of select="publisher"/>
                        </td>
                        <td style="background-color: lightyellow">
                            <xsl:value-of select="edition"/>
                        </td>
                        <td style="background-color: lightyellow">
                            <xsl:value-of select="price"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </center>
    </body>
</html>