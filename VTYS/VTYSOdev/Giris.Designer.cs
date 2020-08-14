namespace VTYSOdev
{
    partial class Giris
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
            this.btn_Ogrenci = new System.Windows.Forms.Button();
            this.txt_id = new System.Windows.Forms.TextBox();
            this.txt_sifre = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.btn_Akademisyen = new System.Windows.Forms.Button();
            this.btn_yonetici = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btn_Ogrenci
            // 
            this.btn_Ogrenci.Location = new System.Drawing.Point(15, 90);
            this.btn_Ogrenci.Name = "btn_Ogrenci";
            this.btn_Ogrenci.Size = new System.Drawing.Size(121, 28);
            this.btn_Ogrenci.TabIndex = 0;
            this.btn_Ogrenci.Text = "Öğrenci Girişi";
            this.btn_Ogrenci.UseVisualStyleBackColor = true;
            this.btn_Ogrenci.Click += new System.EventHandler(this.Btn_Ogrenci_Click);
            // 
            // txt_id
            // 
            this.txt_id.Location = new System.Drawing.Point(15, 25);
            this.txt_id.Name = "txt_id";
            this.txt_id.Size = new System.Drawing.Size(248, 20);
            this.txt_id.TabIndex = 1;
            // 
            // txt_sifre
            // 
            this.txt_sifre.Location = new System.Drawing.Point(15, 64);
            this.txt_sifre.Name = "txt_sifre";
            this.txt_sifre.PasswordChar = '*';
            this.txt_sifre.Size = new System.Drawing.Size(248, 20);
            this.txt_sifre.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(44, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "Numara";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 48);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(28, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Şifre";
            // 
            // btn_Akademisyen
            // 
            this.btn_Akademisyen.Location = new System.Drawing.Point(142, 90);
            this.btn_Akademisyen.Name = "btn_Akademisyen";
            this.btn_Akademisyen.Size = new System.Drawing.Size(121, 28);
            this.btn_Akademisyen.TabIndex = 5;
            this.btn_Akademisyen.Text = "Akademisyen Girişi";
            this.btn_Akademisyen.UseVisualStyleBackColor = true;
            this.btn_Akademisyen.Click += new System.EventHandler(this.Btn_Akademisyen_Click);
            // 
            // btn_yonetici
            // 
            this.btn_yonetici.Location = new System.Drawing.Point(15, 124);
            this.btn_yonetici.Name = "btn_yonetici";
            this.btn_yonetici.Size = new System.Drawing.Size(248, 28);
            this.btn_yonetici.TabIndex = 6;
            this.btn_yonetici.Text = "İdari Personel Giriş";
            this.btn_yonetici.UseVisualStyleBackColor = true;
            this.btn_yonetici.Click += new System.EventHandler(this.Btn_yonetici_Click);
            // 
            // Giris
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(277, 158);
            this.Controls.Add(this.btn_yonetici);
            this.Controls.Add(this.btn_Akademisyen);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txt_sifre);
            this.Controls.Add(this.txt_id);
            this.Controls.Add(this.btn_Ogrenci);
            this.Name = "Giris";
            this.Text = "Üniversite Bilgi Sistemi";
            this.Load += new System.EventHandler(this.Giris_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btn_Ogrenci;
        private System.Windows.Forms.TextBox txt_id;
        private System.Windows.Forms.TextBox txt_sifre;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btn_Akademisyen;
        private System.Windows.Forms.Button btn_yonetici;
    }
}