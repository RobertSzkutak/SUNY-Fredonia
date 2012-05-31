/*
    bitmapreader.cpp : A program written as a homework assignment for a college class demonstrating 
    reading a bitmap image and copying the content into a new bitmap image.
    Copyright (C) 2010  : Robert L Szkutak II

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

*/

#include <fstream>
#include <iostream>

using namespace std;

typedef struct  BITMAPFILEHEADER    /**** BMP file header structure ****/
    {
    unsigned short bfType;           /* Magic number for file */
    unsigned long int   bfSize;           /* Size of file */
    unsigned short bfReserved1;      /* Reserved */
    unsigned short bfReserved2;      /* ... */
    unsigned int   bfOffBits;        /* Offset to bitmap data */
    };

#  define BF_TYPE 0x4D42             /* "MB" */

typedef struct  BITMAPINFOHEADER      /**** BMP file info structure ****/
    {
    unsigned long int   biSize;           /* Size of info header */
    int            biWS;              /* Width of image */
    int            biHS;              /* Height of image */
    unsigned short int biPlanes;         /* Number of color planes */
    unsigned short int biBitCount;       /* Number of bits per pixel */
    unsigned int   biCompression;    /* Type of compression to use */
    unsigned int   biSZ;           /* Size of image data */
    int            biXPelsPerMeter;  /* X pixels per meter */
    int            biYPelsPerMeter;  /* Y pixels per meter */
    unsigned int   biClrUsed;        /* Number of colors used */
    unsigned int   biClrImportant;   /* Number of important colors */
    } ;

int  ReadBmpFileHeader ( BITMAPFILEHEADER *FileHeader, ifstream *fp) {
     
    fp->read((char*)&FileHeader->bfType, sizeof(FileHeader->bfType));
    fp->read((char*)&FileHeader->bfSize, sizeof(FileHeader->bfSize));
    fp->read((char*)&FileHeader->bfReserved1, sizeof(FileHeader->bfReserved1));
    fp->read((char*)&FileHeader->bfReserved2, sizeof(FileHeader->bfReserved2));
    fp->read((char*)&FileHeader->bfOffBits, sizeof(FileHeader->bfOffBits));
    
    return 1;
}

int  WriteBmpFileHeader ( BITMAPFILEHEADER *FileHeader, ofstream *fp) {
    
    fp->write((char*)&FileHeader->bfType, sizeof(FileHeader->bfType));
    fp->write((char*)&FileHeader->bfSize, sizeof(FileHeader->bfSize));
    fp->write((char*)&FileHeader->bfReserved1, sizeof(FileHeader->bfReserved1));
    fp->write((char*)&FileHeader->bfReserved2, sizeof(FileHeader->bfReserved2));
    fp->write((char*)&FileHeader->bfOffBits, sizeof(FileHeader->bfOffBits));
    
    return 1;
}
int  ReadBmpInfoHeader ( BITMAPINFOHEADER *InfoHeader, ifstream *fp) {
    
    fp->read((char*)&InfoHeader->biSize, sizeof(InfoHeader->biSize));
    fp->read((char*)&InfoHeader->biWS, sizeof(InfoHeader->biWS));
    fp->read((char*)&InfoHeader->biHS, sizeof(InfoHeader->biHS));
    fp->read((char*)&InfoHeader->biPlanes, sizeof(InfoHeader->biPlanes));
    fp->read((char*)&InfoHeader->biBitCount, sizeof(InfoHeader->biBitCount));
    fp->read((char*)&InfoHeader->biCompression, sizeof(InfoHeader->biCompression));
    fp->read((char*)&InfoHeader->biSZ, sizeof(InfoHeader->biSZ));
    fp->read((char*)&InfoHeader->biXPelsPerMeter, sizeof(InfoHeader->biXPelsPerMeter));
    fp->read((char*)&InfoHeader->biYPelsPerMeter, sizeof(InfoHeader->biYPelsPerMeter));
    fp->read((char*)&InfoHeader->biClrUsed, sizeof(InfoHeader->biClrUsed));
    fp->read((char*)&InfoHeader->biClrImportant, sizeof(InfoHeader->biClrImportant));
    
    return 1;
}

int  WriteBmpInfoHeader ( BITMAPINFOHEADER *InfoHeader, ofstream *fp) {
     
    fp->write((char*)&InfoHeader->biSize, sizeof(InfoHeader->biSize));
    fp->write((char*)&InfoHeader->biWS, sizeof(InfoHeader->biWS));
    fp->write((char*)&InfoHeader->biHS, sizeof(InfoHeader->biHS));
    fp->write((char*)&InfoHeader->biPlanes, sizeof(InfoHeader->biPlanes));
    fp->write((char*)&InfoHeader->biBitCount, sizeof(InfoHeader->biBitCount));
    fp->write((char*)&InfoHeader->biCompression, sizeof(InfoHeader->biCompression));
    fp->write((char*)&InfoHeader->biSZ, sizeof(InfoHeader->biSZ));
    fp->write((char*)&InfoHeader->biXPelsPerMeter, sizeof(InfoHeader->biXPelsPerMeter));
    fp->write((char*)&InfoHeader->biYPelsPerMeter, sizeof(InfoHeader->biYPelsPerMeter));
    fp->write((char*)&InfoHeader->biClrUsed, sizeof(InfoHeader->biClrUsed));
    fp->write((char*)&InfoHeader->biClrImportant, sizeof(InfoHeader->biClrImportant));
    
    return 1;
}



int main() 
{
    
  BITMAPFILEHEADER bfh;
  BITMAPINFOHEADER bhd;

  ifstream *fp1 = new ifstream("bitmap.bmp", ios::binary);
  ofstream *fp2 = new ofstream("new.bmp", ios::binary);
  
  int  success = 0 ;
  
   /* Open file */
   if (!fp1) {
             
      cerr << "Unable to open BMP file bitmap.bmp" << endl;
      system("pause");
      return -1;
      
   }

   /* Open file */
   if (!fp2) {
             
      cerr << "Unable to write BMP file new.bmp" << endl;
      system("pause");
      return -1;
      
   }
   
   success = ReadBmpFileHeader( &bfh,  fp1) ;
    
   if (!success)
   {
                
        /* Couldn't read the file header - return NULL... */
        fp1->close();
        return -1;
        
   }

   if (bfh.bfType != BF_TYPE)  /* Check for BM reversed, ie MB... */
   {
                  
        cerr << "ID is: " << bfh.bfType << ", should be " << 'M'*256+'B' << endl;
        /* Not a bitmap file - return NULL... */
        fp1->close();
        return -1;
        
   }
        
    cerr << bfh.bfType/256 << " " << bfh.bfType%256 << endl;
    cerr << "Image data size:  " << bfh.bfSize << endl;

    success = 0;
    success = ReadBmpInfoHeader( &bhd, fp1); 
    
    if (!success)
    {
        /* Couldn't read the file header - return NULL... */
        fp2->close();
        return -1;
    }
       
    cerr << "Image Size from Header:  "  << bhd.biSize << endl;
    cerr << "Image Width Size:  " << bhd.biSize << endl;
    cerr << "Image Height Size:  " << bhd.biHS << endl;
    cerr << "Bitcount:  " << bhd.biBitCount << endl;
    
    WriteBmpFileHeader( &bfh, fp2); 
    WriteBmpInfoHeader( &bhd, fp2); 

    unsigned char r, g, b;
    unsigned long int R[256],G[256],B[256];
    
    for (int i=0 ; i < bhd.biWS; i++) 
         for (int j=0 ; j < bhd.biHS; j++) {
           
            fp1->read((char*)&r, sizeof(r));
            R[r]+=1;
            fp1->read((char*)&g, sizeof(g));
            G[g]+=1;
            fp1->read((char*)&b, sizeof(b));
            B[b]+=1;
            // r = 255 - r;
            // g = 255 - g;
            // b = 255 - b;
            fp2->write((char*)&r, sizeof(r));
            fp2->write((char*)&g, sizeof(g));
            fp2->write((char*)&b, sizeof(b));
            
          }
    
    //Output the frequencies
    ofstream output;
    output.open("output.txt");
    output << "RED:" << endl;
    for(int i = 0; i < 256; i++)
    {
       output << R[i] << endl;      
    }
    output << endl << "Green:" << endl;
    for(int i = 0; i < 256; i++)
    {
       output << G[i] << endl;      
    }
    output << endl << "Blue:" << endl;
    for(int i = 0; i < 256; i++)
    {
       output << B[i] << endl;      
    }
    
    output.close();
    fp1->close();
    fp2->close();
  
    system("pause");
  
    return 0;

}
