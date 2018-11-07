<%@ Page Language="C#" %>
<%@ Import Namespace="System.Drawing" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "image/jpeg";
        //40x20
        System.Drawing.Image img = new System.Drawing.Bitmap(40, 20, System.Drawing.Imaging.PixelFormat.Format24bppRgb);
        System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(img);
        System.Drawing.Brush brush = new System.Drawing.Drawing2D.LinearGradientBrush(new Point(0, 0), new Point(40, 20), Color.AliceBlue, Color.Aquamarine);
        System.Drawing.Rectangle rect = new System.Drawing.Rectangle(0, 0, 40, 20);
        g.FillRectangle(brush, rect);
        brush.Dispose();
        System.Random r = new Random();
        string s = r.Next(1000, 9999).ToString();
        Session["secCode"] = s;
        g.TextContrast = 10;
        Font f = new Font("Arial", 9, FontStyle.Strikeout);
        g.DrawString(s, f, new SolidBrush(Color.CadetBlue), new PointF(2, 2));
        g.Dispose();
        img.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
        Response.End();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
