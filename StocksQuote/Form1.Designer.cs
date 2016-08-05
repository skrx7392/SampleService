namespace StocksQuote
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.getQuoteButton = new System.Windows.Forms.Button();
            this.stockSymbol = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(54, 96);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(0, 13);
            this.label1.TabIndex = 1;
            // 
            // getQuoteButton
            // 
            this.getQuoteButton.Location = new System.Drawing.Point(176, 157);
            this.getQuoteButton.Name = "getQuoteButton";
            this.getQuoteButton.Size = new System.Drawing.Size(75, 23);
            this.getQuoteButton.TabIndex = 2;
            this.getQuoteButton.Text = "Get Quote";
            this.getQuoteButton.UseVisualStyleBackColor = true;
            this.getQuoteButton.Click += new System.EventHandler(this.getQuoteButton_Click);
            // 
            // stockSymbol
            // 
            this.stockSymbol.FormattingEnabled = true;
            this.stockSymbol.Location = new System.Drawing.Point(48, 54);
            this.stockSymbol.Name = "stockSymbol";
            this.stockSymbol.Size = new System.Drawing.Size(121, 21);
            this.stockSymbol.TabIndex = 3;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.stockSymbol);
            this.Controls.Add(this.getQuoteButton);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button getQuoteButton;
        private System.Windows.Forms.ComboBox stockSymbol;
    }
}

