let currentFilterParams = {};
let currentPage = 1;
const projectsContainer = document.getElementById('projects-container');
const changepageContainer = document.getElementById('changepage');

function loadProjects(page = 1, filterParams = currentFilterParams) {
  currentPage = page;
  currentFilterParams = filterParams; 
  let query = `/projects?page=${page}`;
  Object.entries(filterParams).forEach(([key, value]) => {
    if (value) {
      query += `&${key}=${encodeURIComponent(value)}`;
    }
  });

  fetch(query, {
    headers: {
      'X-Requested-With': 'XMLHttpRequest'
    }
  })
  .then(response => response.json())
  .then(data => {
    projectsContainer.innerHTML = '';
    data.projects.forEach(project => {
      const projectElement = document.createElement('div');
      projectElement.classList.add('project');
      projectElement.innerHTML = `
        <img src="/images/${project.id}" alt="${project.title}" />
        <div class="project-readmore">
          <a href="/projects/${project.id}" class="project-link">ReadMore</a>
        </div>
        <div class="project-info">
          <p>${project.year}</p>
          <h2>${project.title}</h2>
          <h3>${project.subtitle}</h3>
          <p>${project.location}</p>
          <p>★ ${project.rating}/10</p>
        </div>
      `;
      projectsContainer.appendChild(projectElement);
    });
    updatechangepage(data.total_pages, page);
  })
  .catch(error => {
    console.error('Error loading projects:', error);
  });
}

function updatechangepage(totalPages, currentPage) {
  changepageContainer.innerHTML = '';
  if (currentPage > 1) {
    const prevButton = document.createElement('button');
    prevButton.textContent = '<<';
    prevButton.onclick = () => loadProjects(currentPage - 1, currentFilterParams);
    changepageContainer.appendChild(prevButton);
  }

  for (let i = 1; i <= totalPages; i++) {
    const pageButton = document.createElement('button');
    pageButton.textContent = i;
    pageButton.onclick = () => loadProjects(i, currentFilterParams);
    if (i === currentPage) {
      pageButton.classList.add('active');
    }
    changepageContainer.appendChild(pageButton);
  }

  if (currentPage < totalPages) {
    const nextButton = document.createElement('button');
    nextButton.textContent = '>>';
    nextButton.onclick = () => loadProjects(currentPage + 1, currentFilterParams);
    changepageContainer.appendChild(nextButton);
  }
}

// filter
document.getElementById('filter-form').addEventListener('submit', function(e) {
  e.preventDefault();
  const industry = document.getElementById('industry-select').value;
  const location = document.getElementById('location-select').value;
  const year = document.getElementById('year-select').value;
  loadProjects(1, { industry, location, year });
});

// show alll
document.getElementById('show-all').addEventListener('click', function() {
  loadProjects(1, {});
});

loadProjects();
