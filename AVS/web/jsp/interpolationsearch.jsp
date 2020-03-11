<%-- 
    Document   : interpolationsearch
    Created on : Mar 9, 2020, 8:10:24 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script type="text/javascript" src="../js/interpolationsearch.js"></script>
        <link rel="stylesheet" type="text/css" href="../css/Visual.css" />
     
    </head>
    <body onload ="init();">
        <div class="Visual">
            <div class="leftAlgo">
                <div><input id="txtElement" onkeydown="isNumberKey(event);" type="text" name="name" value="" /></div>
                <div> Progress: <progress id="progressStep" value="1"  max="100" > 0 </progress></div>
                <div>
                    <a id="txtStepcount" style="float: contour"></a> <input id="slideStep" type="range" oninput="chooseStep();" max="0" min="0" value="1">
                </div>
                <div><canvas id="canvasAnimation"></canvas></div>
                <canvas id="canvasGraph"></canvas>
            </div>

            <div class="rightAlgo">
                <input type="submit" onclick="inputByUser();" value="Nhập data" />
                <input id="btnShuffle" type="submit" onclick="shuffle();" value="Shuffle" />
                <div><a>Speed</a> <input id="rangebar" type="range" oninput="changeSpeed();" max="10" min="1" value="1"> </div>
                <div>
                    <input id="btnPrev" type="submit" onclick="back();" value="<" />
                    <input type="submit" onclick=" init('bubblesort');" value="Restart" />
                    <input id="PauseOrCon" type="submit" onclick="resume();" value="Pause" />
                    <input id="btnNext" type="submit" onclick="next();" value=">" />
                </div>
                <div>            
                    <table>        
                        <tr id="line_1"> <td>      int low = 0, high = (arr.length - 1); </td> </tr>
                        <tr id="line_2">  <td>    while (low <= high && x >= arr[low] && x <= arr[high]) </td> </tr>
                        <tr id="line_3"> <td>     {           </td> </tr>
                        <tr id="line_4"><td>         if (low == high) </td> </tr>
                        <tr id="line_5"> <td>        { </td> </tr>
                        <tr id="line_6"> <td>             if (arr[low] == x) return low; </td> </tr>
                        <tr id="line_7"> <td>             return -1; </td> </tr>
                        <tr id="line_8"> <td>           }  </td> </tr>
                        <tr id="line_9"> <td>          int pos = low + (((high-low)/(arr[high]-arr[low]))*(x - arr[low])); </td> </tr>
                        <tr id="line_10"> <td>       if (arr[pos] == x) </td> </tr>
                        <tr id="line_11"> <td>             return pos; </td> </tr>
                        <tr id="line_12"> <td>         if (arr[pos] < x) {</td> </tr>
                        <tr id="line_13"> <td>              low = pos + 1; </td> </tr>
                        <tr id="line_14"> <td>        } else   {  </td> </tr>
                        <tr id="line_15"> <td>             high = pos - 1; }</td> </tr>
                        <tr id="line_16"> <td>     } </td> </tr>
                        <tr id="line_17"> <td>      return -1; </td> </tr>
                        <tr id="line_18"> <td>   } </td> </tr>
                    </table>
                </div>

            </div>
        </div>

    </body>      
</html>
