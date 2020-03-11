<%-- 
    Document   : linearsearch
    Created on : Mar 9, 2020, 8:00:12 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script type="text/javascript" src="../js/Sort.js"></script>
        <link rel="stylesheet" type="text/css" href="../css/Visual.css" />
    </head>
    <body onload ="init('binarysearch');">
        <div class="Visual">
            <div class="leftAlgo">
                <div><input id="txtElement" onkeydown="isNumberKey(event);" type="text" name="name" value="" /></div>
                <div><input id="txtSearchnumber" onkeydown="isNumberKey(event);" type="text" value="" /></div>
                <div> Progress: <progress id="progressStep" value="1"  max="100" > 0 </progress></div>
                <div>
                    <a id="txtStepcount" style="float: contour"></a> <input id="slideStep" type="range" oninput="chooseStep();" max="0" min="0" value="1">
                </div>
                <div><canvas id="canvasAnimation"></canvas></div>
                <canvas id="canvasGraph"></canvas>
            </div>

            <div class="rightAlgo">
                <input type="submit" onclick="interpolationsearch();" value="Nhập data" />
                <input id="btnShuffle" type="submit" onclick="random();" value="Random" />
                <div><a>Speed</a> <input id="rangebar" type="range" oninput="changeSpeed();" max="10" min="1" value="1"> </div>
                <div>
                    <input id="btnPrev" type="submit" onclick="back();" value="<" />
                    <input type="submit" onclick=" init('binarysearch');" value="Restart" />
                    <input id="PauseOrCon" type="submit" onclick="resume();" value="Pause" />
                    <input id="btnNext" type="submit" onclick="next();" value=">" />
                </div>
                <div>
                    <table><tr id="line_1"> <td>int binarySearch(int arr[], int left, int right, int x) { </td></tr><tr id="line_2"> <td>&emsp;&emsp;if (right >= left) {</td></tr><tr id="line_3"> <td>&emsp;&emsp;&emsp;&emsp;int mid = left + (right - l) / 2; </td></tr><tr id="line_4"> <td>&emsp;&emsp;&emsp;&emsp;if (arr[mid] == x) {</td></tr><tr id="line_5"> <td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;return mid; </td></tr><tr id="line_6"> <td>&emsp;&emsp;&emsp;&emsp;}</td></tr><tr id="line_7"> <td>&emsp;&emsp;&emsp;&emsp;if (arr[mid] > x) {</td></tr><tr id="line_8"> <td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;return binarySearch(arr, left, mid - 1, x);</td></tr><tr id="line_9"> <td>&emsp;&emsp;&emsp;&emsp;}</td></tr><tr id="line_10"> <td>&emsp;&emsp;&emsp;&emsp;return binarySearch(arr, mid + left, right, x);</td></tr><tr id="line_11"> <td>&emsp;&emsp;} </td></tr><tr id="line_12"> <td>&emsp;&emsp;return -1;</td></tr><tr id="line_13"> <td>}</td></tr></table>
                    
                </div>
                <br>
                <div id="txtlog">Log:</div>

            </div>
        </div>

    </body>      
</html>
