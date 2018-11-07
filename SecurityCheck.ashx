<%@ WebHandler Language="C#" Class="securityCode" %>

using System;
using System.Web;
using System.Drawing;

public class securityCode : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "image/jpeg";
        //40x20
        System.Drawing.Image img = new System.Drawing.Bitmap(40, 20, System.Drawing.Imaging.PixelFormat.Format24bppRgb);
        System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(img);
        Brush brush = new System.Drawing.Drawing2D.LinearGradientBrush(new Point(0, 0), new Point(40, 20), Color.Chocolate, Color.Chartreuse);
        Rectangle rect = new Rectangle(0, 0, 40, 20);
        g.FillRectangle(brush, rect);
        brush.Dispose();
        System.Random r = new Random();
        string s = r.Next(1000, 9999).ToString();
        //context.Session["secCode"] = s;
        g.TextContrast = 10;
        Font f = new Font("Arial", 9, FontStyle.Bold);
        g.DrawString(s, f, new SolidBrush(Color.AntiqueWhite), new PointF(2, 2));
        g.Dispose();
        img.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}