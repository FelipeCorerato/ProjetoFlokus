﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetoPratica
{
    public partial class sec_pac : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("indexGeral.aspx");
        }
<<<<<<< HEAD
=======

        protected void btnAdicionar_Click(object sender, EventArgs e)
        {
            Response.Redirect("sec_pac_add.aspx");
        }
>>>>>>> a6f1e508817b1cd359cdf7169ad6b061599cdcd2
    }
}