Dir.chdir(File.dirname(__FILE__))


File.read("Livre.txt")


mot = gets.chomp










static Matrice coutcumulatif(GrapheMat* graphe)
{
	Matrice M = (int*)malloc (sizeof(int)*graphe->nMax*graphe->nMax);
	int* p = (int*)malloc (sizeof(int)*graphe->n);
	memset(p,0,graphe->n);
	
    // initialisation par défaut
    for(int i=0; i<graphe->nMax; i++)
    {
        for (int j=0; j<graphe->nMax; j++)
        {
            M[i*graphe->nMax+j] = INFINI;
        }
    }
    
    for(int i=0;i<graphe->nMax;i++)
    {
    	for(int j=0;j<graphe->nMax;j++)
    	{
    		if(graphe->element[i*graphe->nMax+j]==vrai)
    		{
    			if(i==0)
    			{
    				M[i*graphe->nMax+j] = graphe->valeur[i*graphe->nMax+j];
    				p[j]=M[i*graphe->nMax+j];
				}
				else
				{
					M[i*graphe->nMax+j] = graphe->valeur[i*graphe->nMax+j]+p[i];
					p[j]=M[i*graphe->nMax+j];
				}
			}
		}
	}
	
	return M;
}









float n1=0;float n2=0;float n3=0;
float n4=0;float n5=0;float n6=0;