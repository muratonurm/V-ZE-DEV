namespace VTYSOdev
{
    partial class AkademisyenEkran
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
            this.data_dersler = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.txt_ogrenci_no = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txt_not = new System.Windows.Forms.TextBox();
            this.btn_not_ver = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.data_dersler)).BeginInit();
            this.SuspendLayout();
            // 
            // data_dersler
            // 
            this.data_dersler.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.data_dersler.Location = new System.Drawing.Point(15, 25);
            this.data_dersler.Name = "data_dersler";
            this.data_dersler.Size = new System.Drawing.Size(466, 229);
            this.data_dersler.TabIndex = 0;
            this.data_dersler.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.Data_dersler_CellContentClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Öğrencilerim";
            // 
            // txt_ogrenci_no
            // 
            this.txt_ogrenci_no.Location = new System.Drawing.Point(487, 41);
            this.txt_ogrenci_no.Name = "txt_ogrenci_no";
            this.txt_ogrenci_no.Size = new System.Drawing.Size(192, 20);
            this.txt_ogrenci_no.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(487, 25);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(70, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Öğrenci No : ";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(487, 74);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(30, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Not :";
            // 
            // txt_not
            // 
            this.txt_not.Location = new System.Drawing.Point(487, 90);
            this.txt_not.Name = "txt_not";
            this.txt_not.Size = new System.Drawing.Size(192, 20);
            this.txt_not.TabIndex = 5;
            // 
            // btn_not_ver
            // 
            this.btn_not_ver.Location = new System.Drawing.Point(487, 116);
            this.btn_not_ver.Name = "btn_not_ver";
            this.btn_not_ver.Size = new System.Drawing.Size(192, 38);
            this.btn_not_ver.TabIndex = 6;
            this.btn_not_ver.Text = "Notunu Ver";
            this.btn_not_ver.UseVisualStyleBackColor = true;
            this.btn_not_ver.Click += new System.EventHandler(this.Btn_not_ver_Click);
            // 
            // AkademisyenEkran
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(689, 268);
            this.Controls.Add(this.btn_not_ver);
            this.Controls.Add(this.txt_not);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txt_ogrenci_no);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.data_dersler);
            this.Name = "AkademisyenEkran";
            this.Text = "AkademisyenEkran";
            this.Load += new System.EventHandler(this.AkademisyenEkran_Load);
            ((System.ComponentModel.ISupportInitialize)(this.data_dersler)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView data_dersler;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txt_ogrenci_no;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txt_not;
        private System.Windows.Forms.Button btn_not_ver;
    }
}