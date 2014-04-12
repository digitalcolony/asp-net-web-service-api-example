using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using com.deepfitness;

public partial class lab_deepfitness_api_deepfitness_api : System.Web.UI.Page
{
    public DeepFitnessService dfs = new DeepFitnessService();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {            
            ddlTags.DataSource = dfs.GetTags();
            ddlTags.DataValueField = "tagName";
            ddlTags.DataBind();
        }
        GetArticlesByTagName();
    }

    protected void GetArticlesByTagName()
    {
        string tagName = ddlTags.SelectedValue;
        dvArticle.InnerHtml = "";
        lblTitle.Text = "";
        lblSelectedTagName.Text = tagName;
        dlArticles.DataSource = dfs.GetArticlesByTagName(tagName);
        dlArticles.DataBind();
    }

    protected void LinkButton_Command(Object sender, CommandEventArgs e)
    {
        int articleID;
        articleID = Convert.ToInt16(e.CommandArgument);
        // get article
        WebArticleDetails article = dfs.GetArticle(articleID);
        lblTitle.Text = article.Title;
        dvArticle.InnerHtml = article.Page;
    }
  
}
